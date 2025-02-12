//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

class TaskListPresenter: TaskListModuleInput, TaskListViewOutput {

    weak var view: TaskListViewInput!
    var interactor: TaskListInteractorInput!
    var router: TaskListRouterInput!

    func viewIsReady() {
//        view.setupInitialState(with: filter.name)
        
        interactor.getTaskList()
    }
    

}

// MARK: TaskListInteractorOutput

extension TaskListPresenter: TaskListInteractorOutput {
    
    func didLoad(tasks: [Task]) {
        view.show(tasks: tasks)
    }
    
}
