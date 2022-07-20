//
//  Character.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation

struct Character: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var resourceURI: String?
    var urls: [MarvelURL]?
    var thumbnail: MarvelImage?
    var comics: ComicList?
    var stories: StoryList?
    var events: EventList?
    var series: SeriesList?
}

