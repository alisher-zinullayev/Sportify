//
//  DefaultListOfTournamentsForRegion.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 25.11.2023.
//

import Foundation

protocol ListOfTournamentsForRegionDataSource: AnyObject {
    func fetchTournamentsForRegion(for id: String) async throws -> [TournamentDetail]
}

final class DefaultListOfTournamentsForRegion: ListOfTournamentsForRegionDataSource {
    
    static let shared = DefaultListOfTournamentsForRegion()
    
    func fetchTournamentsForRegion(for id: String) async throws -> [TournamentDetail] {
        guard let url = URL(string: "http://77.243.80.52:8000/api/v1/competitions/?region=\(id)") else {
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
