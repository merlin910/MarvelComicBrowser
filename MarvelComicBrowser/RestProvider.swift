//
//  RestProvider.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/1/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public enum HTTPMethod: String {
    case options
    case get
    case head
    case post
    case put
    case patch
    case delete
    case trace
    case connect
}

public class RestProvider {

    func execute(method: HTTPMethod, request: String, parameters: [String: AnyObject]?) -> Request {
        return Request(Alamofire.request(alamoMethodForHTTPMethod(method), request, parameters: parameters).validate())
    }

    private func alamoMethodForHTTPMethod(method: HTTPMethod) -> Alamofire.Method {
        switch method {
        case HTTPMethod.options:
            return .options
        case HTTPMethod.get:
            return .get
        case HTTPMethod.head:
            return .head
        case HTTPMethod.post:
            return .post
        case HTTPMethod.put:
            return .put
        case HTTPMethod.patch:
            return .patch
        case HTTPMethod.delete:
            return .delete
        case HTTPMethod.trace:
            return .trace
        case HTTPMethod.connect:
            return .connect
        }
    }
}
