//
//  TaskListInteractorOutput.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import Foundation

protocol TaskListInteractorOutput: AnyObject {
    
    /// This method calls when tasks was successfully loaded
    /// - Parameter tasks: task list
    func didLoad(tasks:[Task])
    
    // TODO
    // func loadingDidFail
    
}
