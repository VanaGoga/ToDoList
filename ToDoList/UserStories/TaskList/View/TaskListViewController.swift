//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import UIKit

class TaskListViewController: UIViewController, TaskListViewInput {
    
    var output: TaskListViewOutput!
    //    var
    private let tableView = UITableView()
    private var headerView: UIView!
    private var titleLabel: UILabel!
    private var delegate: TaskListTableViewDelegate?

    private let maxHeaderHeight: CGFloat = 200
    private let minHeaderHeight: CGFloat = 80
    
    private var headerHeightConstraint: NSLayoutConstraint!
    private var titleBottomConstraint: NSLayoutConstraint!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        view.backgroundColor = .black
        
        setupTableView()
        setupTableHeaderView()
        
//        delegate?.setupConstraints(headerHeightConstraint: headerHeightConstraint, titleBottomConstraint: titleBottomConstraint)
    }
    
    private func setupTableView() {
        delegate = TaskListTableViewDelegate()
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func setupTableHeaderView() {
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: maxHeaderHeight))
        headerView.backgroundColor = .systemBlue
        
        titleLabel = UILabel()
        titleLabel.text = "Заголовок"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20)
        ])
        
        tableView.tableHeaderView = headerView
    }

    // MARK: TaskListViewInput
    func setupInitialState() {
    }
}
