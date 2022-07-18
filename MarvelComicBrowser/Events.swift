//
//  Events.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation

struct EventList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [EventSummary]?
}

struct EventSummary: Codable {
    var resourceURI: String?
    var name: String?
}

