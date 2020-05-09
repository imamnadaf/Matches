//
//  MatchesInteractor.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol MatchesInteractorProtocol {
    func getMatches()
}

protocol MatchesDataStore {
    var venues: [Venue] { get set }
}

class MatchesInteractor: MatchesInteractorProtocol, MatchesDataStore {
    
    var worker: MatchesWorker = MatchesWorker(dataStore: APIStore.instance)
    var presenter: MatchesPresenterProtocol?
    var venues: [Venue] = []
    
    func getMatches() {
        let request = MatchRequest(ll: "40.7484,-73.9857", oauth_token: "NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ", v: "20180616")
        worker.getMatches(request: request) { (venues) in
            self.venues = venues
            let response = MatchesDetails.Fetch.Response(venues: venues)
            self.presenter?.presentMatchDetails(response: response)
        }
    }
}
