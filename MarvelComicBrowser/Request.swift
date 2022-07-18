//
//  Request.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/22/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public class Request {
    var alamofireRequest: Alamofire.Request

    init(_ request: Alamofire.Request) {
        alamofireRequest = request
    }

    public func responseObject<T: Codable>(completionHandler: (object: Response<T, NSError>) -> Void) -> Self {
        alamofireRequest.responseObject { (response: Alamofire.Response<T, NSError>) -> Void in
            completionHandler(object: Response(request: self.alamofireRequest, response: response.response, data: response.result.value, error: response.result.error))
        }
        return self
    }

    public func responseData(completionHandler: (object: Response<NSData, NSError>) -> Void) -> Self {
        alamofireRequest.responseData { (response: Alamofire.Response<NSData, NSError>) -> Void in
            completionHandler(object: Response<NSData, NSError>(request: self.alamofireRequest, response: response.response, data: response.data, error: response.result.error))
        }
        return self
    }
}

public struct Response<Value, U: ErrorType> {
    public let request: Alamofire.Request?
    public let response: NSHTTPURLResponse?
    public let data: Value?
    public let error: U?

    public init(request: Alamofire.Request?, response: NSHTTPURLResponse?, data: Value?, error: U?) {
        self.request = request
        self.response = response
        self.data = data
        self.error = error
    }
}
