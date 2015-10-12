//
//  CharacterStack.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation

class DataContainerStack {
    
    func getData(parameters: NSDictionary? = NSDictionary()) -> DataIterator {
        let baseUrl = "http://gateway.marvel.com:80/v1/public/"
        let endpoint = "characters"
        var authParameters = ["ts": 1, "apikey":"5f7093b7fcb53ef6660cc990d3e2f2e8", "hash":"8c64424f4384d307ea7ce8f365aefa8d"]
        authParameters += parameters as! [String : NSObject]
        
        return DataIterator.init(request: baseUrl + endpoint, parameters: authParameters)
    }
}


func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}
