//
//  DataIterator.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/1/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

class DataIterator<T: Mappable> {
    
    var request: String
    var parameters = [String: AnyObject]()
    var page: Int
    
    init(request: String, parameters: [String: AnyObject]) {
        self.request = request
        self.parameters = parameters
        self.page = 0
    }
    
    func nextPage(completionHandler: (pageOfData: [T]?) -> Void) {
        self.parameters["offset"] = String(20 * self.page)
        self.page++
        
        getPage(self.page) { (pageOfData) -> Void in
            completionHandler(pageOfData: pageOfData)
        }

    
    }
    
    func getPage<T: Mappable>(page: Int, completionHandler:(pageOfData: [T]?) -> Void) {
        RestProvider().execute(.GET, request: request, parameters: parameters)
        .responseObject() { (object:MarvelDataWrapper<DataContainer<T>>) -> Void in
            if let results = object.data?.results {
                completionHandler(pageOfData: results)
            }
        }
        .responseData { (object) -> Void in
            print("Got data")
        }
    }
    
}