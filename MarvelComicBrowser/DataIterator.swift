//
//  DataIterator.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/1/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation

class DataIterator {
    
    var request: String
    var parameters = [String: AnyObject]()
    var page: Int
    
    init(request: String, parameters: [String: AnyObject]) {
        self.request = request
        self.parameters = parameters
        self.page = 0
    }
    
    
    
    func getCharacterPage(page: Int, completionHandler:(pageOfData: [Character]?) -> Void) {
        RestProvider().makeCharacterRequest(.GET, request: request, parameters: parameters) { (object) -> Void in
            completionHandler(pageOfData: object.data?.results)
        }
    }
    
    func nextCharacterPage(completionHandler: (pageOfData: [Character]?) -> Void) {
        self.parameters["offset"] = String(20 * self.page)
        self.page++
        
        getCharacterPage(self.page) { (pageOfData) -> Void in
            completionHandler(pageOfData: pageOfData)
        }
    }
    
    
    
    
    func getComicPage(page: Int, completionHandler:(pageOfData: [Comic]?) -> Void) {
        RestProvider().makeComicRequest(.GET, request: request, parameters: parameters) { (object) -> Void in
            completionHandler(pageOfData: object.data?.results)
        }
    }
    
    func nextComicPage(completionHandler: (pageOfData: [Comic]?) -> Void) {
        self.parameters["offset"] = String(20 * self.page)
        self.page++
        
        getComicPage(self.page) { (pageOfData) -> Void in
            completionHandler(pageOfData: pageOfData)
        }
    }
}