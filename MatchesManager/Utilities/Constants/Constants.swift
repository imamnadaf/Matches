//
//  Constants.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

typealias MatchesResponseHandler = (Matches?, Error?) -> Void
typealias MatchesDataHandler = ([Venue]) -> Void
struct K {
    typealias Parameters = [String: Any]
    static let baseUrl = "https://api.foursquare.com"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "application/json"
}
