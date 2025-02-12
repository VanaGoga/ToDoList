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
        tableViewHandler?.setupInitialState(with: tableView)

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
