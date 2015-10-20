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

public class RestProvider {
    
    func makeCharacterRequest(method: HTTPMethod, request: String, parameters: [String: AnyObject]?, requestComplete:(object:MarvelDataWrapper<DataContainer<Character>>) -> Void ) {
        Alamofire.request(alamoMethodForHTTPMethod(method), request, parameters: parameters)
            .responseObject { (response: MarvelDataWrapper<DataContainer<Character>>?, error:ErrorType?) in
                if let results = response {
                    requestComplete(object: results);
                }
        }
    }
    
    func makeComicRequest(method: HTTPMethod, request: String, parameters: [String: AnyObject]?, requestComplete:(object:MarvelDataWrapper<DataContainer<Comic>>) -> Void ) {
        Alamofire.request(alamoMethodForHTTPMethod(method), request, parameters: parameters)
            .responseObject { (response: MarvelDataWrapper<DataContainer<Comic>>?, error:ErrorType?) in
                if let results = response {
                    requestComplete(object: results);
                }
        }
    }
    
    func makeRequest<U>(method: HTTPMethod, request: String, parameters: [String: AnyObject]?, requestComplete:(object:U) -> Void) {

        Alamofire.request(alamoMethodForHTTPMethod(method), request, parameters: parameters)
            .responseObject { (response:U, error:ErrorType?) -> Void in
//            if let 
            }

    }
    
    
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
