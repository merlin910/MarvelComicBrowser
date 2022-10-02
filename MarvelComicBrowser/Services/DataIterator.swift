//
//  DataIterator.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 10/1/15.
//  Copyright © 2015 SingletonConsulting. All rights reserved.
//

import Foundation

class DataIterator<T: Codable> {

    var request: String
    var parameters = [String: String]()
    var page: Int

    init(request: String, parameters: [String: String]) {
        self.request = request
        self.parameters = parameters
        self.page = 0
    }

    func nextPage(completionHandler: (_ pageOfData: [T]?) -> Void) {
//        self.parameters["offset"] = String(20 * page)
//        self.page += 1
//
//        getPage(page) { (pageOfData) -> Void in
//            completionHandler(pageOfData: pageOfData)
//        }
    }

    func getPage<T: Codable>(page: Int, completionHandler: (_ pageOfData: [T]?) -> Void) {
//        RestProvider().execute(.GET, request: request, parameters: parameters)
//                .responseObject() { (object: Response<MarvelDataWrapper<DataContainer<T>>, NSError>) -> Void in
//                    if let results = object.data?.data?.results {
//                        completionHandler(pageOfData: results)
//                    }
//                }
//                .responseData { (object: Response<NSData, NSError>) -> Void in
//                    print("Got data")
//                }
    }
}