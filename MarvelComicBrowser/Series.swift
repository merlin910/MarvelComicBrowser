//
//  Series.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation

struct SeriesList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [SeriesSummary]?
}

struct SeriesSummary: Codable {
    var resourceURI: String?
    var name: String?
}