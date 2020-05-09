//
//  EndPoint.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

public enum EndPoint: String {
    case matches = "/v2/venues/search"
    
    public var description: String {
            return rawValue
    }
}
