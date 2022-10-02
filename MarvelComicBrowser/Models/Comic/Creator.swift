//
//  Creator.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import Foundation

struct CreatorList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [CreatorSummary]?
}

struct CreatorSummary: Codable {
    var resourceURI: String?
    var name: String?
    var role: String?
}