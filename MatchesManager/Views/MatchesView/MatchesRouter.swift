//
//  MatchesRouter.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol MatchesRoutingProtocol {
    
}

protocol MatchesDataPassing {
    var dataStore: MatchesDataStore? { get }
}

class MatchesRouter: MatchesRoutingProtocol, MatchesDataPassing {
    var viewController: MatchesDisplayProtocol?
    var dataStore: MatchesDataStore?
}
