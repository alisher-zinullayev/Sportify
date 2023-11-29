//
//  Regions.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import Foundation

struct Regions: Codable {
    let data: [Region]
}

struct Region: Codable {
    let slug: String
    let region: String
    let image: String?
}
