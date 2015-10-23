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
    
    public func responseObject<T: Mappable>(completionHandler: (object: T) -> Void) -> Self {
        alamofireRequest.responseObject { (response: T?, error: ErrorType?) -> Void in
            if let results = response {
                completionHandler(object: results);
            }
        }
        return self
    }
    
    public func responseData(completionHandler: (object: Response<NSData, NSError>) -> Void) -> Self {
        alamofireRequest.responseData { (response:Alamofire.Response<NSData, NSError>) -> Void in
                completionHandler(object: Response<NSData, NSError>(request: self.alamofireRequest, response: response.response, data: response.data, error: response.result.error))
        }
        return self
    }
}


public struct Response<Value, Error: ErrorType> {
    public let request: Alamofire.Request?
    public let response: NSHTTPURLResponse?
    public let data: Value?
    public let error: Error?
    
    public init(request: Alamofire.Request?, response: NSHTTPURLResponse?, data: Value?, error: Error?) {
        self.request = request
        self.response = response
        self.data = data
        self.error = error
    }
}
