//
//  StudentLastFights.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import Foundation

struct StudentLastFightsData: Codable {
    let data: [StudentLastFights]
}

struct StudentLastFights: Codable {
    let competition: Competition
    let games: [Games]
}

struct Competition: Codable {
    let id: String
    let name: String
    let start_date: String
    let end_date: String
}

struct Games: Codable {
    let id: String
    let red_corner: Participant
    let blue_corner: Participant
    let level: Int
    let index: Int
    let result: String
}

struct Participant: Codable {
    let student_info: StudentInformation
}

struct StudentInformation: Codable {
    let first_name: String
    let last_name: String
    let club: Club
}
