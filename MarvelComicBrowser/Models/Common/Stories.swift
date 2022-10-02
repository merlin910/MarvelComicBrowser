//
//  Stories.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import Foundation

struct StoryList: Codable {
    var available: Int
    var returned: Int
    var collectionURI: String
    var items: [StorySummary]
}

struct StorySummary: Codable {
    var resourceURI: String
    var name: String
    var type: String
}