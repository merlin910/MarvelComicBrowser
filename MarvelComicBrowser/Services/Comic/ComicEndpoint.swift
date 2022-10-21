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
        nil
    }

    var queryParameters: [String: String]? {
       ["ts":"1", "apikey":"d3cded808b5440849f6ec244d514e48a", "hash": "d76cd382191355ca3fc55105da55c1bc"]
    }
}

struct Request: Endpoint {
    let path: String
    let method: HTTPMethod
    let header: [String: String]?
    let body: [String: String]?
    var queryParameters: [String: String]?

    init(path: String, method: HTTPMethod, header: [String: String]?, body: [String: String]?, queryParameters: [String: String]?) {
        self.path = path
        self.method = method
        self.header = header
        self.body = body

        var updatedParameters = ["ts": "1", "apikey": "d3cded808b5440849f6ec244d514e48a", "hash": "d76cd382191355ca3fc55105da55c1bc"]
        if let queryParameters {
            for (key, value) in queryParameters {
                updatedParameters[key] = value
            }
        }
        self.queryParameters = updatedParameters
    }
}