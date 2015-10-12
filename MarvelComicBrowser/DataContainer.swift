//
//  DataContainer.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

struct DataContainer<T : Mappable> : Mappable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results :[T]?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        offset <- map["offset"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
        results <- map["results"]
    }
}