//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import Foundation

class TaskListPresenter: TaskListModuleInput {

    weak var view: TaskListViewInput!
    var interactor: TaskListInteractorInput!
    var router: TaskListRouterInput!
    var state = TaskListState()

}

// MARK: TaskListViewOutput

extension TaskListPresenter: TaskListViewOutput {
    
    func viewIsReady() {
        interactor.getTaskList()
    }
    
    func didHighlightTask(at index: Int) {
        state.hightlightedTaskIndex = index
    }
    
    func didPressDeleteAction() {
        guard let index = state.hightlightedTaskIndex else { return }
        state.tasks.remove(at: index)
        view.deleteTask(at: IndexPath(row: index, section: 0))
        interactor.deleteTask(at: index)
        state.hightlightedTaskIndex = nil
    }
    
    func didPressEditTask(at index: Int) {
        
    }
    
    func didPressShareTask(at index: Int) {
        
    }
    
}

// MARK: TaskListInteractorOutput

extension TaskListPresenter: TaskListInteractorOutput {
    
    func didLoad(tasks: [Task]) {
        state.tasks = tasks
        
        if !Thread.isMainThread {
            DispatchQueue.main.async { [weak self] in
                self?.view.show(tasks: tasks)
            }
        } else {
            view.show(tasks: tasks)
        }
    }
    
}


