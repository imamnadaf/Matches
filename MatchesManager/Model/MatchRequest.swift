//
//  MatchRequest.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

struct MatchRequest: Codable {
    let ll: String
    let oauth_token: String
    let v: String
}
