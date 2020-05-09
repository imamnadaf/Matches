//
//  MatchesWorker.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

class MatchesWorker: BaseWorker {
    
    func getMatches(request: MatchRequest, completion: @escaping MatchesDataHandler) {
        dataStore.matchesService.getMatches(request: request) { (response, error) in
            if let matches = response {
                completion(matches.response.venues)
            } else {
                completion([])
            }
        }
    }
}
