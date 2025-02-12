//
//  TaskListViewInput.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

protocol TaskListViewInput: AnyObject {

    /// Setup initial state of the view
    func setupInitialState()
    
    /// Show list of tasks
    /// - Parameter tasks: array of taks
    func show(tasks: [Task])
}
