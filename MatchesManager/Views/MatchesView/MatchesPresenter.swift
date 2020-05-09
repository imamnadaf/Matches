//
//  MatchesPresenter.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol MatchesPresenterProtocol {
    func presentMatchDetails(response: MatchesDetails.Fetch.Response)
}

class MatchesPresenter: MatchesPresenterProtocol {
    var viewController: MatchesDisplayProtocol?
    
    func presentMatchDetails(response: MatchesDetails.Fetch.Response) {
        var displayMatchDetails: [MatchesDetails.Fetch.ViewModel.DisplayMatchDetail] = []
        
        for venue in response.venues {
            let data = MatchesDetails.Fetch.ViewModel.DisplayMatchDetail(id: venue.id, name: venue.name, phone: venue.contact.phone ?? "Not Available")
            displayMatchDetails.append(data)
        }
        
        let viewModel = MatchesDetails.Fetch.ViewModel(displayedDetails: displayMatchDetails)
        viewController?.displayMatchDetails(viewModel: viewModel)
    }
}
