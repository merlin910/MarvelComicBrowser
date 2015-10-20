//
//  Character.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

struct Character : Mappable {
    var id: Int?
    var name: String?
    var description : String?
    var resourceURI : String?
    var urls : [URL]?
    var thumbnail : MarvelImage?
    var comics : ComicList?
    var stories : StoryList?
    var events : EventList?
    var series : SeriesList?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id  <- map["id"]
        name   <- map["name"]
        description <- map["description"]
        resourceURI <- map["resourceURI"]
        urls <- map["urls"]
        thumbnail <- map["thumbnail"]
        comics <- map["comics"]
        stories <- map["stories"]
        series <- map["series"]
    }
}

