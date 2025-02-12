//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import UIKit

class TaskListViewController: UIViewController {
    
    var output: TaskListViewOutput!

    private let tableView = UITableView()
    private var headerView: UIView!
    private var titleLabel: UILabel!
    private var tableViewHandler: TaskListTableViewHandler?

    private let maxHeaderHeight: CGFloat = 200
    private let minHeaderHeight: CGFloat = 80
    
    private var headerHeightConstraint: NSLayoutConstraint!
    private var titleBottomConstraint: NSLayoutConstraint!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = TaskListConstants.backgroundColor
        
        setupTableView()
        setupTableHeaderView()
        
        output.viewIsReady()
    }

    private func setupTableView() {
        tableViewHandler = TaskListTableViewHandler()
        tableViewHandler?.setupInitialState(with: tableView, output: self)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        tableView.backgroundColor = .black

        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func setupTableHeaderView() {
        headerView = TaskListHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        
        tableView.tableHeaderView = headerView
    }

}

// MARK: TaskListViewInput

extension TaskListViewController: TaskListViewInput {
    
    func setupInitialState() {
    }
    
    func show(tasks: [Task]) {
        tableViewHandler?.show(tasks: tasks)
        
        tableView.reloadData()
    }
    
}


// MARK: TaskListTableViewHandlerOutput

extension TaskListViewController: TaskListTableViewHandlerOutput {
    
    func showActions(for index: IndexPath) {
        let alertController = UIAlertController(title: "Действия", message: "Выберите действие для задачи task", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Редактировать", style: .default, handler: { _ in
            self.editTask(at: index)
        }))
        
        alertController.addAction(UIAlertAction(title: "Поделиться", style: .default, handler: { _ in
//            self.shareTask(task)
        }))
        
        alertController.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { _ in
            self.deleteTask(at: index)
        }))
        
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func editTask(at indexPath: IndexPath) {
//           print("Редактирование задачи: \(tasks[indexPath.row])")
    }
    
    private func shareTask(_ task: String) {
        print("Поделиться задачей: \(task)")
    }
    
    private func deleteTask(at indexPath: IndexPath) {
//           tasks.remove(at: indexPath.row)
//           tableView.deleteRows(at: [indexPath], with: .fade)
        print("Удалено!")
    }
    
    
}
