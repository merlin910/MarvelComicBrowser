//
//  Stories.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper


struct StoryList : Mappable {
    var available : Int?
    var returned : Int?
    var collectionURI : String?
    var items : [StorySummary]?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        available <- map["available"]
        returned <- map["returned"]
        collectionURI <- map["collectionURI"]
        items <- map["items"]
    }
}

struct StorySummary : Mappable {
    var resourceURI : String?
    var name : String?
    var type : String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        name <- map["name"]
        type <- map["type"]
    }
}