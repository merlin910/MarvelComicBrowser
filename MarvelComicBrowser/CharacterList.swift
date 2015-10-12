//
//  CharacterList.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

struct CharacterList : Mappable {
    var available : Int?
    var returned : Int?
    var collectionURI : String?
    var items : [CharacterSummary]?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        available <- map["available"]
        returned <- map["returned"]
        collectionURI <- map["collectionURI"]
        items <- map["items"]
    }
}


struct CharacterSummary : Mappable {
    var resourceURI : String?
    var name : String?
    var role : String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        name <- map["name"]
        role <- map["role"]
    }
}