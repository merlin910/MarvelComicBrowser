//
//  ComicCollectionStack.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/2/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ComicCollectionStack {
    
    func getComics(uri: String, completionHandler:(comics: [Comic]?) -> Void) {
        _ = "http://gateway.marvel.com:80/v1/public/"
        let endpoint = uri
        let authParameters = ["ts": 1, "apikey":"5f7093b7fcb53ef6660cc990d3e2f2e8", "hash":"8c64424f4384d307ea7ce8f365aefa8d"]
        
        Alamofire.request(.GET, endpoint, parameters: authParameters)
            .responseObject { (response: MarvelDataWrapper<DataContainer<Comic>>?, error:ErrorType?) in
                if let results = response {
                    completionHandler(comics: results.data?.results);
                }
        }
    }
}
