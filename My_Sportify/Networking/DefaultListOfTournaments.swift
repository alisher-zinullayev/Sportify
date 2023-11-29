//
//  DefaultListOfTournaments.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import Foundation

protocol ListOfTournamentsDataSource: AnyObject {
    func fetchTournaments() async throws -> [TournamentDetail]
}

final class DefaultListOfTournaments: ListOfTournamentsDataSource {
    
    static let shared = DefaultListOfTournaments()
    
    func fetchTournaments() async throws -> [TournamentDetail] {
        
        guard let url = URL(string: "http://77.243.80.52:8000/api/v1/competitions/") else {
            print("from url")
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(from: request.url!)
            let decodedResponse = try JSONDecoder().decode(TournamentResponse.self, from: data)
            return decodedResponse.data
        } catch {
            throw NetworkError.networkError(error)
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case networkError(Error)
    case rateLimitExceeded
}
