//
//  DataIterator.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/1/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class DataIterator {
    
    var request: String
    var parameters = [String: AnyObject]()
    var page: Int
    
    init(request: String, parameters: [String: AnyObject]) {
        self.request = request
        self.parameters = parameters
        self.page = 0
    }
    
    
    func getPage(page: Int, completionHandler:(pageOfData: [Character]?) -> Void) {
        Alamofire.request(.GET, request, parameters: parameters)
            .responseObject { (response: MarvelDataWrapper<DataContainer<Character>>?, error:ErrorType?) in
                if let results = response {
                    completionHandler(pageOfData: results.data?.results);
                }
        }
    }
    
    func nextPage(completionHandler: (pageOfData: [Character]?) -> Void) {
        self.parameters["offset"] = String(20 * self.page)
        self.page++
        
        getPage(self.page) { (pageOfData) -> Void in
            completionHandler(pageOfData: pageOfData)
        }
    }    
}