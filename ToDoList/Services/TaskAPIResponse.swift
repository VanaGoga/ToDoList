//
//  TaskAPIResponse.swift
//  ToDoList
//
//  Created by Савва on 12.02.2025.
//

import Foundation

struct TaskAPIResponse: Decodable {
    let todos: [Todo]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Todo: Decodable {
    let id: Int
    let title: String
    let completed: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "todo"
        case completed
    }
}
