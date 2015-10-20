//
//  MavelDataWrapper.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/29/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

class MarvelDataWrapper<T : Mappable> : Mappable {
    
    var code : Int?
    var status : String?
    var copyright : String?
    var attributionText : String?
    var attributionHTML : String?
    var data : T?
    var etag : String?
    
    required init(_ map: Map) {

    }
    
    init () {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        copyright <- map["copyright"]
        attributionText <- map["attributionText"]
        attributionHTML <- map["attributionHTML"]
        data <- map["data"]
        etag <- map["etag"]
    }
}
