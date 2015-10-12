//
//  ComicPrice.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

struct ComicPrice : Mappable {
    var type : String?
    var price : Double?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        price <- map["price"]
    }
}