//
//  MatchesService.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol MatchesServiceProtocol {
    func getMatches(request: MatchRequest, completion: @escaping MatchesResponseHandler)
}


class MatchesService:BaseNetworkService, MatchesServiceProtocol {
    
    func getMatches(request: MatchRequest, completion: @escaping MatchesResponseHandler) {
        self.networkService.performRequest(for: Matches.self, route: MatchesAPIRouter.getMatches(request: request)) { (response, error) in
            completion(response, error)
        }
    }
}
