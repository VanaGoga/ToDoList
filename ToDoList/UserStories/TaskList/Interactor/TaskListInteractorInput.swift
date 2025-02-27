//
//  TaskListInteractorInput.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import Foundation

protocol TaskListInteractorInput {
    
    /// Get list of tasks
    func getTaskList() 
    
    func deleteTask(at index: Int)
    
    func changeTask(at index: Int, task: Task)
    
}
