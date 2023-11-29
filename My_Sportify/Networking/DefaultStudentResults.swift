//
//  DefaultStudentResults.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import Foundation

protocol StudentResultsProtocol: AnyObject {
    func fetchStudentResults(for id: String) async throws -> [ResultInCompetition]
}

class DefaultStudentResults: StudentResultsProtocol {
    
    static let shared = DefaultStudentResults()

    func fetchStudentResults(for id: String) async throws -> [ResultInCompetition] {
        guard let url = URL(string: "http://77.243.80.52:8000/api/v1/students/\(id)/results_in_competitions/") else {
            print("from url")
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(from: request.url!)
            let decodedResponse = try JSONDecoder().decode(ResultsInCompetitions.self, from: data)
            return decodedResponse.data
        } catch {
            throw NetworkError.networkError(error)
        }
    }
    
}
