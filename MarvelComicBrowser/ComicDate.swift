//
//  ComicDate.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

struct ComicDate : Mappable {
    var type : String?
    var date : String?
    
    init?(_ map: Map) {
    
    }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        date <- map["date"]
    }
}