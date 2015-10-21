//
//  DataIterator.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/1/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
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
    
    func nextPage<T: Mappable>(type: T.Type, completionHandler: (pageOfData: [T]?) -> Void) {
        self.parameters["offset"] = String(20 * self.page)
        self.page++
        
        getPage(self.page, type: T.self) { (pageOfData) -> Void in
            completionHandler(pageOfData: pageOfData)
        }
    }
    

    func getPage<T: Mappable>(page: Int, type: T.Type, completionHandler:(pageOfData: [T]?) -> Void) {
        RestProvider<MarvelDataWrapper<DataContainer<T>>>().execute(.GET, request: request, parameters: parameters) { (object) -> Void in
            completionHandler(pageOfData: object.data?.results)
        }
    }
    
}