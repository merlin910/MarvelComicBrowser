//
//  MarvelImage.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import Foundation

enum ImageSizeEnum: CustomStringConvertible {  // Swift 2.0; for < 2.0 use Printable
    case small
    case medium
    case large
    case xLarge
    case fantastic
    case amazing

    var description: String {
        switch self {
            // Use Internationalization, as appropriate.
        case .small: return "standard_small"
        case .medium: return "standard_medium"
        case .large: return "standard_large"
        case .xLarge: return "standard_xlarge"
        case .fantastic: return "portrait_fantastic"
        case .amazing: return "standard_amazing"
        }
    }
}

struct MarvelImage: Codable {
    var path: String?
    var fileExtension: String?

    enum CodingKeys: String, CodingKey {
        case path = "path"
        case fileExtension = "extension"
    }

    func fullPath(size: ImageSizeEnum) -> String? {
        if let path = path, let fileExtension = fileExtension {
            return path + "/" + size.description + "." + fileExtension
        }
        return nil
    }
}
