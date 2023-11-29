//
//  CompetitionResult.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import Foundation

struct CompetitionResults {
    let data: [CompetitionResult]
}

struct CompetitionResult {
    let competition: Competition
    let place: Int
}
