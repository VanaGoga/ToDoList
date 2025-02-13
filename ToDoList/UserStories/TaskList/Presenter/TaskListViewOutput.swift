//
//  TaskListViewOutput.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

protocol TaskListViewOutput {

    /// Notify presenter that view is ready
    func viewIsReady()
    
    func didHighlightTask(at index: Int)
    func didSelectTask(at index: Int)
    
    func didPressDeleteAction()
    
    func didPressEditAction()
    
    func didPressShareAction()
}
