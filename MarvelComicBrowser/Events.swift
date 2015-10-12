//
//  Events.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper


struct EventList : Mappable {
    var available : Int?
    var returned : Int?
    var collectionURI : String?
    var items : [EventSummary]?
    
    init?(_ map: Map) { }
    
    mutating func mapping(map: Map) {
        available <- map["available"]
        returned <- map["returned"]
        collectionURI <- map["collectionURI"]
        items <- map["items"]
    }
}

struct EventSummary : Mappable {
    var resourceURI : String?
    var name : String?
    
    init?(_ map: Map) { }
    
    mutating func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        name <- map["name"]
    }
}

