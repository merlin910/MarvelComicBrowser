//
// Created by deric kramer on 10/16/22.
// Copyright (c) 2022 SingletonConsulting. All rights reserved.
//

import Foundation

class CharacterService {
    let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getCharacters() async throws -> [Character] {
        let charactersRequest = Request(path: "characters",
                                        method: .get,
                                        header: ["Content-Type": "application/json;charset=utf-8"],
                                        body: nil,
                                        queryParameters: nil)
        let charactersResponse: DataWrapper<Character> = try await httpClient.sendRequest(endpoint: charactersRequest)
        return charactersResponse.data.results
    }
}