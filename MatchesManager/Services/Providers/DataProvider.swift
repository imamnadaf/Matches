//
//  DataProvider.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol DataProviderProtocol {
     var matchesService: MatchesServiceProtocol { get }
}

class APIStore: DataProviderProtocol {
    
    static let instance = APIStore()
    private var networkService: NetworkServiceProtocol
    private init() {
        self.networkService = NetworkServiceManager()
    }
    
    var matchesService: MatchesServiceProtocol {
        return MatchesService(networkService: self.networkService)
    }
}

class CoreDataStore: DataProviderProtocol {
    
    static let instance = CoreDataStore()
    private init() {}
    
    var matchesService: MatchesServiceProtocol {
        fatalError()
    }
    
}
