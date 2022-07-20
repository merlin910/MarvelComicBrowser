//
// Created by Deric Kramer on 7/19/22.
// Copyright (c) 2022 ToolWatch. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParameters: [String: String]? { get }
}

extension Endpoint {
    var baseURL: String {
        "http://gateway.marvel.com:80/v1/public/" // TODO: get this value from the environment.
    }

    var asURLRequest: URLRequest {
        get throws {
            let urlString = endpoint.baseURL + endpoint.path
            guard let urlComponents = URLComponents(string: urlString) else {
                throw RequestError.invalidURL
            }
            urlComponents.queryItems = endpoint.queryParameters.map {
                URLQueryItem(name: $0, value: $1)
            }

            var request = URLRequest(url: urlComponents.url)
            request.httpMethod = endpoint.method.rawValue
            request.allHTTPHeaderFields = endpoint.header

            if let body = endpoint.body {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            }
        }
    }
}

enum RequestError: Error {  // TODO: trim this down to just the Request Errors
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
