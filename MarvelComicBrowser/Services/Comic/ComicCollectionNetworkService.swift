//
//  ComicCollectionStack.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/2/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import Foundation

class ComicCollectionNetworkService {

    let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getComics() async throws -> [Comic] {
        let comicsResponse: DataContainer<Comic> = try await httpClient.sendRequest(endpoint: ComicEndpoint.comics)
        return comicsResponse.results
    }

//    func getComics(uri: String, completionHandler: (comics: [Comic]?) -> Void) {
//        _ = "http://gateway.marvel.com:80/v1/public/"
//        let endpoint = uri
//        let authParameters = ["ts": 1, "apikey": "5f7093b7fcb53ef6660cc990d3e2f2e8", "hash": "8c64424f4384d307ea7ce8f365aefa8d"]
//
//        let requestClient: HTTPClient = HTTPClientImplementation()
//        requestClient.sendRequest(endpoint: )
//
////        Alamofire.request(.GET, endpoint, parameters: authParameters)
////                .responseObject { (response: Alamofire.Response<MarvelDataWrapper<DataContainer<Comic>>, NSError>?) -> Void in
////                    if let results = response?.result.value {
////                        completionHandler(comics: results.data?.results)
////                    }
////                }
//    }
}
