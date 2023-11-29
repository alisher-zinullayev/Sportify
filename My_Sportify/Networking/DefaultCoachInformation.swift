//
//  DefaultCoachInformation.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 29.11.2023.
//

import Foundation

protocol DefaultCoachInformationProtocol: AnyObject {
    func fetchCoachInformation(for id: String) async throws -> CoachInfo
}

class DefaultCoachInformation: DefaultCoachInformationProtocol {
    
    static let shared = DefaultCoachInformation()
    
    func fetchCoachInformation(for id: String) async throws -> CoachInfo {
        guard let url = URL(string: "http://77.243.80.52:8000/api/v1/coaches/\(id)/") else {
            print("from url")
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(from: request.url!)
            let decodedResponse = try JSONDecoder().decode(CoachInfo.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.networkError(error)
        }
    }
    
}
