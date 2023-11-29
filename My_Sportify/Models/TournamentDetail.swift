//
//  TournamentDetail.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import Foundation

struct TournamentResponse: Codable {
    let data: [TournamentDetail]
}

struct TournamentDetail: Codable {
    let id: String
    let name: String
    let start_date: String
    let end_date: String
    let organizator: OrganizatorType
    let location: String
    let address: String
    let federation: String
    let competition_type: String
    let region: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case start_date
        case end_date
        case organizator
        case location
        case address
        case federation
        case competition_type // case "competitionType" = competition_type
        case region
    }
}

struct OrganizatorType: Codable {
    let id: String
    let first_name: String
    let last_name: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case first_name
        case last_name
        case image
    }
}
