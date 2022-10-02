//
// Created by Deric Kramer on 7/19/22.
// Copyright (c) 2022 SingletonConsulting. All rights reserved.
//

import Foundation

enum ComicEndpoint {
    case comics
    case comic(comicId: Int)
    case comicsCharacters(comicId: Int)
}

extension ComicEndpoint: Endpoint {
    var path: String {
        switch self {
        case .comics:
            return "comics"
        case .comic(let comicId):
            return "comics/\(comicId)"
        case .comicsCharacters(let comicId):
            return "comics/\(comicId)/characters"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .comics, .comic, .comicsCharacters:
            return .get
        }
    }

    var header: [String: String]? {
        ["Content-Type": "application/json;charset=utf-8"]
    }

    var body: [String: String]? {
        [:]
    }

    var queryParameters: [String: String]? {
       ["ts":"1", "apikey":"d3cded808b5440849f6ec244d514e48a"]
    }
}
