//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

class TaskListPresenter: TaskListModuleInput, TaskListViewOutput, TaskListInteractorOutput {

    weak var view: TaskListViewInput!
    var interactor: TaskListInteractorInput!
    var router: TaskListRouterInput!

    func viewIsReady() {

    }
}
