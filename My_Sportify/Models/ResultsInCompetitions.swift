//
//  ResultsInCompetitions.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import Foundation

struct ResultsInCompetitions: Codable {
    let data: [ResultInCompetition]
}

struct ResultInCompetition: Codable {
    let competition: Competition
    let place: Int
}
