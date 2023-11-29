//
//  CoachInfo.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import Foundation

struct CoachInfo: Codable {
    let id: String
    let first_name: String
    let last_name: String
    let image: String
    let club: Club
    let students: [Student]
}

struct Student: Codable {
    let id: String
    let first_name: String
    let last_name: String
    let image: String?
}
