//
// Created by deric kramer on 10/16/22.
// Copyright (c) 2022 SingletonConsulting. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(imageURL: URL) {  // TODO: this does not cache images.
        Task {
            print("Starting network request... \(Thread.current)")
            let (imageData, _) = try await URLSession.shared.data(from: imageURL)
            image = UIImage(data: imageData)
        }
    }
}

// TODO: hasnt worked yet, needs more testing.
actor ImageLoader {
    private var images: [URLRequest: LoaderStatus] = [:]

    public func fetch(_ url: URL) async throws -> UIImage {
        let request = URLRequest(url: url)
        return try await fetch(request)
    }

    public func fetch(_ urlRequest: URLRequest) async throws -> UIImage {
        if let status = images[urlRequest] {
            switch status {
            case .fetched(let image):
                return image
            case .inProgress(let task):
                return try await task.value
            }
        }

        if let image = try self.imageFromFileSystem(for: urlRequest) {
            images[urlRequest] = .fetched(image)
            return image
        }

        let task: Task<UIImage, Error> = Task {
            let (imageData, _) = try await URLSession.shared.data(for: urlRequest)
            let image = UIImage(data: imageData)!
            try self.persistImage(image, for: urlRequest)
            return image
        }

        images[urlRequest] = .inProgress(task)

        let image = try await task.value

        images[urlRequest] = .fetched(image)

        return image
    }

    private enum LoaderStatus {
        case inProgress(Task<UIImage, Error>)
        case fetched(UIImage)
    }

    private func imageFromFileSystem(for urlRequest: URLRequest) throws -> UIImage? {
        guard let url = fileName(for: urlRequest) else {
            assertionFailure("Unable to generate a local path for \(urlRequest)")
            return nil
        }

        let data = try Data(contentsOf: url)
        return UIImage(data: data)
    }

    private func fileName(for urlRequest: URLRequest) -> URL? {
        guard let fileName = urlRequest.url?.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let applicationSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return nil
        }

        return applicationSupport.appendingPathComponent(fileName)
    }

    private func persistImage(_ image: UIImage, for urlRequest: URLRequest) throws {
        guard let url = fileName(for: urlRequest),
              let data = image.jpegData(compressionQuality: 0.8) else {
            assertionFailure("Unable to generate a local path for \(urlRequest)")
            return
        }

        try data.write(to: url)
    }
}