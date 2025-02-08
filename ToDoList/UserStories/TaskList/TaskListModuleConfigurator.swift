//
//  TaskListModuleConfigurator.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import UIKit

class TaskListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TaskListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TaskListViewController) {

        let router = TaskListRouter()

        let presenter = TaskListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TaskListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
