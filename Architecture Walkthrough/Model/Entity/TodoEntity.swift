//
//  TodoEntity.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 23/06/2022.
//

import Foundation

struct TodoEntity:  Codable{
    let userID, id: Int
    let title: String
    let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
}
