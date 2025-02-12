//
//  TodoListServiceInput.swift
//  ToDoList
//
//  Created by Савва on 12.02.2025.
//

import Foundation

protocol TodoListServiceInput: AnyObject {
    
    func loadTasks(completion: @escaping (ServiceResponse<[Task]>) -> Void)
    
}
