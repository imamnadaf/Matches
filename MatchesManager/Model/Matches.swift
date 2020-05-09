//
//  Matches.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation


// MARK: - Matches
struct Matches: Codable {
    let meta: Meta
    let notifications: [Notification]
    let response: Response
}


// MARK: - Meta
struct Meta: Codable {
    let code: Int?
    let requestID: String?

    enum CodingKeys: String, CodingKey {
        case code
        case requestID
    }
}

// MARK: - Notification
struct Notification: Codable {
    let type: String
    let item: Item
}

// MARK: - Item
struct Item: Codable {
    let unreadCount: Int
}

// MARK: - Response
struct Response: Codable {
    let venues: [Venue]
    let confident: Bool
    enum CodingKeys: String, CodingKey {
           case venues
           case confident
       }
}

// MARK: - Venue
struct Venue: Codable {
    let id: String
    let name: String
    let contact: Contact
    let location: Location
    let categories: [Category]
    let verified: Bool
    let stats: Stats
    let beenHere: BeenHere
    let venuePage: VenuePageElement?
    let hereNow: HereNow
    let referralID: ReferralID?
    let venueChains: [VenuePageElement]
    let hasPerk: Bool
    let url: String?
    let venueRatingBlacklisted: Bool?
    let storeID: String?
    let allowMenuURLEdit: Bool?
    let menu: Menu?

    enum CodingKeys: String, CodingKey {
        case id, name, contact, location, categories, verified, stats, beenHere, venuePage, hereNow
        case referralID
        case venueChains, hasPerk, url, venueRatingBlacklisted
        case storeID
        case allowMenuURLEdit
        case menu
    }
}

// MARK: - BeenHere
struct BeenHere: Codable {
    let lastCheckinExpiredAt: Int
}

// MARK: - Category
struct Category: Codable {
    let id: String?
    let name, pluralName, shortName: String
    let icon: Icon
    let primary: Bool
}

// MARK: - Icon
struct Icon: Codable {
    let iconPrefix: String?
    let suffix: Suffix?

    enum CodingKeys: String, CodingKey {
        case iconPrefix
        case suffix
    }
}

enum Suffix: String, Codable {
    case png = ".png"
}


// MARK: - Contact
struct Contact: Codable {
    let phone, formattedPhone, twitter, instagram: String?
    let facebook, facebookUsername, facebookName: String?
}

// MARK: - HereNow
struct HereNow: Codable {
    let count: Int
    let summary: Summary
    let groups: [String]?
}

enum Summary: String, Codable {
    case nobodyHere = "Nobody here"
}


// MARK: - Location
struct Location: Codable {
    let address, crossStreet: String?
    let lat, lng: Double
    let labeledLatLngs: [LabeledLatLng]?
    let distance: Int
    let postalCode: String?
    let cc: Cc
    let city: City
    let state: State
    let country: Country
    let formattedAddress: [String]
    let neighborhood: String?
}

enum Cc: String, Codable {
    case us = "US"
}

enum City: String, Codable {
    case newYork = "New York"
}

enum Country: String, Codable {
    case unitedStates = "United States"
}

// MARK: - LabeledLatLng
struct LabeledLatLng: Codable {
    let label: Label
    let lat, lng: Double
}

enum Label: String, Codable {
    case display = "display"
    case entrance = "entrance"
}

enum State: String, Codable {
    case ny = "NY"
}

// MARK: - Menu
struct Menu: Codable {
    let type, label, anchor: String
    let url, mobileURL, externalURL: String?

    enum CodingKeys: String, CodingKey {
        case type, label, anchor, url
        case mobileURL
        case externalURL
    }
}

enum ReferralID: String, Codable {
    case v1589004826 = "v-1589004826"
}


// MARK: - Stats
struct Stats: Codable {
    let tipCount, usersCount, checkinsCount: Int
}

// MARK: - VenuePageElement
struct VenuePageElement: Codable {
    let id: String
}
