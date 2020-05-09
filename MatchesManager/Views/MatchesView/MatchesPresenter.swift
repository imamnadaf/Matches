//
//  MatchesPresenter.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol MatchesPresenterProtocol {
    func presentMatchDetails(response: MatchesDetails.Fetch.Response, savedMatches: [SavedMatch])
    func presentSavedMatches(response: [SavedMatch])
}

class MatchesPresenter: MatchesPresenterProtocol {
    var viewController: MatchesDisplayProtocol?
    
    func presentMatchDetails(response: MatchesDetails.Fetch.Response,  savedMatches: [SavedMatch]) {
        var savedMatchesIds: [String] = []
        for savedMatch in savedMatches {
            savedMatchesIds.append(savedMatch.id)
        }
        var displayMatchDetails: [MatchesDetails.Fetch.ViewModel.DisplayMatchDetail] = []
        for venue in response.venues {
            let data = MatchesDetails.Fetch.ViewModel.DisplayMatchDetail(id: venue.id, name: venue.name,  isStarred: savedMatchesIds.contains(venue.id))
            displayMatchDetails.append(data)
        }
        
        let viewModel = MatchesDetails.Fetch.ViewModel(displayedDetails: displayMatchDetails)
        viewController?.displayMatchDetails(viewModel: viewModel)
    }
    
    func presentSavedMatches(response: [SavedMatch]) {
        var displayMatchDetails: [MatchesDetails.Fetch.ViewModel.DisplayMatchDetail] = []
        for savesMatch in response {
            let data = MatchesDetails.Fetch.ViewModel.DisplayMatchDetail(id: savesMatch.id, name: savesMatch.name, isStarred: true)
            displayMatchDetails.append(data)
        }
        let viewModel = MatchesDetails.Fetch.ViewModel(displayedDetails: displayMatchDetails)
        viewController?.displayMatchDetails(viewModel: viewModel)
    }
}
