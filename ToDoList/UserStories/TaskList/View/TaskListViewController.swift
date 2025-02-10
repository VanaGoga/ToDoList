//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import UIKit

class TaskListViewController: UIViewController, TaskListViewInput {
    
    var output: TaskListViewOutput!

    private let tableView = UITableView()
    private var headerView: UIView!
    private var titleLabel: UILabel!
    private var delegate: TaskListTableViewDelegate?

    private let maxHeaderHeight: CGFloat = 200
    private let minHeaderHeight: CGFloat = 80
    
    private var headerHeightConstraint: NSLayoutConstraint!
    private var titleBottomConstraint: NSLayoutConstraint!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        view.backgroundColor = TaskListConstants.backgroundColor
        
        setupTableView()
        setupTableHeaderView()
    }
    
    private func setupTableView() {
        delegate = TaskListTableViewDelegate()
        tableView.delegate = delegate
        tableView.dataSource = delegate
//        TaskCell
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: "TaskListTableViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        
//        let margins = view.layoutMarginsGuide
//        let guide = view.safeAreaLayoutGuide
//          NSLayoutConstraint.activate([
//            view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
//            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0)
////           view.topAnchor.constraint(eqguide.topAnchor, multiplier: 1.0),
////           guide.bottomAnchor.constraint(view.bottomAnchor, multiplier: 1.0)
//           ])
        
//        NSLayoutConstraint.activate([
//            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
//
//        ])
//
        view.addSubview(tableView)
        
//        tableView.translatesAutoresizingMaskIntoConstraints = false
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

    // MARK: TaskListViewInput
    func setupInitialState() {
    }
}
