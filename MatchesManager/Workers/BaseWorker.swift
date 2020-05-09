//
//  BaseWorker.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

class BaseWorker {
    var dataStore: DataProviderProtocol

    init(dataStore: DataProviderProtocol) {
        self.dataStore = dataStore
    }
}
