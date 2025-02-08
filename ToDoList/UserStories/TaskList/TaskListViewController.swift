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
    private let headerView  = UIView()
    private let titleLabel = UILabel()
    
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        view.backgroundColor = .green
    }
    
    private func setupTableView() {
//        tableView.delegate = self
        
    }

    // MARK: {{module_info.name}}ViewInput
    func setupInitialState() {
    }
}
