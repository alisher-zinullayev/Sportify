//
//  DefaultStudentInformation.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import Foundation

protocol StudentInformationProtocol: AnyObject {
    func fetchStudentInformation(for id: String) async throws -> StudentInfo
}

class DefaultStudentInformation: StudentInformationProtocol {
    
    static let shared = DefaultStudentInformation()
    
    func fetchStudentInformation(for id: String) async throws -> StudentInfo {
        // "http://77.243.80.52:8000/api/v1/students/\(id)"
     // http://77.243.80.52:8000/api/v1/students/e100de96-af40-431a-97b0-b9db98509eb5/
        guard let url = URL(string: "http://77.243.80.52:8000/api/v1/students/\(id)/") else {
            print("from url")
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(from: request.url!)
            let values = try JSONDecoder().decode(StudentInfo.self, from: data)
            return values
        } catch {
            throw NetworkError.networkError(error)
        }
    }
}
