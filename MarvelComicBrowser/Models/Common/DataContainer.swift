//
//  DataContainer.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation

struct DataContainer<T: Codable>: Codable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [T]
}