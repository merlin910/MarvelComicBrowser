//
// Created by Deric Kramer on 7/19/22.
// Copyright (c) 2022 SingletonConsulting. All rights reserved.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint) async throws -> T
}

class HTTPClientImplementation: HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint) async throws -> T {
        do {
            let (data, response) = try await performRequest(endpoint.asURLRequest)
            guard let response = response as? HTTPURLResponse else {
                throw RequestError.noResponse
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                    throw RequestError.decode
                }
                return decodedResponse
            case 401:
                throw RequestError.unauthorized
            default:
                throw RequestError.unexpectedStatusCode
            }
        } catch {
            throw error as? RequestError ?? RequestError.unknown
        }
    }

    private func performRequest(_ request: URLRequest) async throws -> (Data, URLResponse) {
        if #available(iOS 15.0, *) {
            return try await URLSession.shared.data(for: request, delegate: nil)
        } else {
            // Fallback on earlier versions
            return try await URLSession.shared.data(from: request)
        }
    }

}

extension URLSession {
    @available(iOS, deprecated: 15.0, message: "This extension is no longer necessary. Use API built into SDK")
    func data(from request: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            guard let url = request.url else {
                return continuation.resume(throwing: RequestError.invalidURL)
            }
            let task = self.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }

                continuation.resume(returning: (data, response))
            }

            task.resume()
        }
    }
}

