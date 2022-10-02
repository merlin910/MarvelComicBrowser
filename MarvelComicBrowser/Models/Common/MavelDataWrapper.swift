//
//  MavelDataWrapper.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/29/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import Foundation

class MarvelDataWrapper<T: Codable>: Codable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var data: T?
    var etag: String?
}
