//
//  StudentInfo.swift
//  My_Sportify
//
//  Created by Alisher Zinullayev on 26.11.2023.
//

import Foundation

/*
 
 
 {
     "id": "e100de96-af40-431a-97b0-b9db98509eb5",
     "first_name": "Әлішер",
     "last_name": "Кәрім",
     "image": "http://77.243.80.52:8000/media/students/e100de96-af40-431a-97b0-b9db98509eb5.jpeg",
     "club": {
         "id": "0de34288-810a-466a-8be6-bf7dcacd00da",
         "name": "Кайрат",
         "logo": "http://77.243.80.52:8000/media/clubs/0de34288-810a-466a-8be6-bf7dcacd00da.jpeg",
         "location": "Алматы"
     },
     "location": "Алматы",
     "coach": {
         "id": "bde9b3d2-822d-4bb4-9c12-64ad161e788d",
         "first_name": "Кайрат",
         "last_name": "Адилкерей",
         "image": "http://77.243.80.52:8000/media/coach/bde9b3d2-822d-4bb4-9c12-64ad161e788d.jpeg"
     },
     "date_of_birth": "2002-01-01",
     "achievement": "Мастер спортына үміткен",
     "is_republic_winner": false
 }
 
 */

struct StudentInfo: Codable {
    let id: String
    let first_name: String
    let last_name: String
    let image: String?
    let club: Club
    let location: String
    let coach: Coach
    let date_of_birth: String
    let achievement: String?
    let is_republic_winner: Bool
}

struct Club: Codable {
    let id: String
    let name: String
    let logo: String?
    let location: String
}

struct Coach: Codable {
    let id: String
    let first_name: String
    let last_name: String
    let image: String?
}
