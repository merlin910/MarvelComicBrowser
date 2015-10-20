//
//  Comic.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper


struct Comic : Mappable {
    var id : Int? 
//    var digitalId : Int?
    var title : String?
//    var issueNumber : Double?
//    var variantDescription : String?
    var description : String?
//    var modified : String?
//    var isbn : String?
//    var upc : String?
//    var diamondCode : String?
//    var ean : String?
//    var issn : String?
//    var format : String?
//    var pageCount : Int?
//    var textObjects : [TextObject]?
//    var resourceURI : String?
//    var urls : [URL]?
//    var series : SeriesSummary?
//    var variants : [ComicSummary]?
//    var collections : [ComicSummary]?
//    var collectedIssues : [ComicSummary]?
//    var dates :[ComicDate]?
//    var prices : [ComicPrice]?
    var thumbnail : MarvelImage?
//    var images : [MarvelImage]?
//    var creators : CreatorList?
//    var characters : CharacterList?
//    var stories : StoryList?
//    var events : EventList?
    init(){}
    
    init?(_ map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
//        digitalId <- map["digitalId"]
        title <- map["title"]
//        issueNumber <- map["issueNumber"]
//        variantDescription <- map["variantDescription"]
        description <- map["description"]
//        modified <- map["modified"]
//        isbn <- map["isbn"]
//        upc <- map["upc"]
//        diamondCode <- map["diamondCode"]
//        ean <- map["ean"]
//        issn <- map["issn"]
//        format <- map["format"]
//        pageCount <- map["pageCount"]
//        textObjects <- map["textObjects"]
//        resourceURI <- map["resourceURI"]
//        urls <- map["urls"]
//        series <- map["series"]
//        variants <- map["variants"]
//        collections <- map["collections"]
//        collectedIssues <- map["collectedIssues"]
//        dates <- map["dates"]
//        prices <- map["prices"]
        thumbnail <- map["thumbnail"]
//        images <- map["images"]
//        creators <- map["creators"]
//        characters <- map["characters"]
//        stories <- map["stories"]
//        events <- map["events"]
    }
    
}





