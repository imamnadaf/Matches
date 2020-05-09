//
//  File.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

enum MatchesDetails {
    enum Fetch {
        struct Request {
            
        }
        struct Response {
            var venues: [Venue]
        }
        struct ViewModel {
            struct DisplayMatchDetail {
                let id: String
                let name: String
                let phone: String
            }
            var displayedDetails: [DisplayMatchDetail]
        }
    }
}
