//
//  DefaultLastFightsOfStudent.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import Foundation

protocol LastFightsOfStudent: AnyObject {
    func fetchLastFights(for id: String) async throws -> [StudentLastFights]
}

class DefaultLastFightsOfStudent: LastFightsOfStudent {
    
    static let shared = DefaultLastFightsOfStudent()
    
    func fetchLastFights(for id: String) async throws -> [StudentLastFights] {
        guard let url = URL(string: "http://77.243.80.52:8000/api/v1/students/\(id)/last_fights/") else {
            print("from url")
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(from: request.url!)
            let decodedResponse = try JSONDecoder().decode(StudentLastFightsData.self, from: data)
            return decodedResponse.data
        } catch {
            throw NetworkError.networkError(error)
        }
    }
}
