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
            class DisplayMatchDetail {
                let id: String
                let name: String
                let phone: String
                var isStarred: Bool
                init(id: String, name: String, phone: String, isStarred: Bool) {
                    self.id = id
                    self.name = name
                    self.phone = phone
                    
                    self.isStarred = isStarred
                }
            }
            var displayedDetails: [DisplayMatchDetail]
        }
    }
}
