//
//  NetwerkService.swift
//  ToDoList
//
//  Created by Савва on 12.02.2025.
//

import Foundation
import CoreData
import UIKit

class TodoListService: TodoListServiceInput {
    
    private let url = URL(string: "https://dummyjson.com/todos")!
    
    func loadTasks(completion: @escaping (ServiceResponse<[Task]>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.error(error: error))
                return
            }
            guard let data = data else {
                completion(.success(result: []))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(TaskAPIResponse.self, from: data)
                
                let currentDate = Date()
                let tasks = apiResponse.todos.map { Task(title: $0.title, details: "", date: currentDate, isCompleted: $0.completed) }
                completion(.success(result: tasks))
            } catch {
                completion(.error(error: error))
            }
        }.resume()
    }

}
