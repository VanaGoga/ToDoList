//
//  TaskListInteractorOutput.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import Foundation

protocol TaskListInteractorOutput: AnyObject {

    func didLoad(tasks:[Task])
    
    // TODO
    // func loadingDidFail
    
}
