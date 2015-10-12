//
//  MarvelTextObject.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper


struct TextObject : Mappable {
    var type : String?
    var language : String?
    var text : String?
    
    init?(_ map: Map) { }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        language <- map["language"]
        text <- map["text"]
    }
}