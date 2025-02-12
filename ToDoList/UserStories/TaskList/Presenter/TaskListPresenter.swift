//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import Foundation

class TaskListPresenter: TaskListModuleInput, TaskListViewOutput {

    weak var view: TaskListViewInput!
    var interactor: TaskListInteractorInput!
    var router: TaskListRouterInput!

    func viewIsReady() {
        interactor.getTaskList()
    }
    

}

// MARK: TaskListInteractorOutput

extension TaskListPresenter: TaskListInteractorOutput {
    
    func didLoad(tasks: [Task]) {
        if !Thread.isMainThread {
            DispatchQueue.main.async { [weak self] in
                self?.view.show(tasks: tasks)
            }
        } else {
            view.show(tasks: tasks)
        }
    }
    
}
