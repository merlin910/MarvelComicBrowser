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


public enum HTTPMethod : String {
    case OPTIONS
    case GET
    case HEAD
    case POST
    case PUT
    case PATCH
    case DELETE
    case TRACE
    case CONNECT
}

public class RestProvider<T: Mappable> {
    
    func execute(method: HTTPMethod, request: String, parameters: [String: AnyObject]?, requestComplete:(object:T) -> Void) {
        
        Alamofire.request(alamoMethodForHTTPMethod(method), request, parameters: parameters)
            .responseObject { (response: T?, error: ErrorType?) -> Void in
                if let results = response {
                    requestComplete(object: results);
                }
        }
    }
    
    
    private func alamoMethodForHTTPMethod(method: HTTPMethod) -> Alamofire.Method {
        switch method {
        case HTTPMethod.OPTIONS:
            return .OPTIONS
        case HTTPMethod.GET:
            return .GET
        case HTTPMethod.HEAD:
            return .HEAD
        case HTTPMethod.POST:
            return .POST
        case HTTPMethod.PUT:
            return .PUT
        case HTTPMethod.PATCH:
            return .PATCH
        case HTTPMethod.DELETE:
            return .DELETE
        case HTTPMethod.TRACE:
            return .TRACE
        case HTTPMethod.CONNECT:
            return .CONNECT
        }
    }
}
