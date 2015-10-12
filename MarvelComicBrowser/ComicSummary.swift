//
//  ComicSummary.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

struct ComicSummary : Mappable {
    var resourceURI : String?
    var name : String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        name <- map["name"]
    }
}
