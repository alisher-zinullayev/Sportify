//
//  RegionsDataSource.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import Foundation

protocol RegionsDataSource {
    func listRegions() -> [Region]
}

class DefaultRegionsDataSource: RegionsDataSource {
    
    static let shared = DefaultRegionsDataSource()
    
    func listRegions() -> [Region] {
        if let path = Bundle.main.path(forResource: "regionsList", ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let regions = try jsonDecoder.decode(Regions.self, from: data)
                return regions.data
            } catch {
                print("Error decoding JSON: \(error)")
                return []
            }
        }
        return []
    }
}
