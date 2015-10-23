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
    
    public func responseData(completionHandler: (object: NSData) -> Void) -> Self {
        alamofireRequest.responseData { (response:Response<NSData, NSError>) -> Void in
            switch response.result {
            case .Success:
                completionHandler(object: response.data!)
            case .Failure(let error):
                print(error)
            }
        }
        return self
    }
}
