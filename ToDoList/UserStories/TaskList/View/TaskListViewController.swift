//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import UIKit

class TaskListViewController: UIViewController, TaskListTableViewHandlerOutput {
    
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
    
    func deleteTask(at indexPath: IndexPath) {
        tableViewHandler?.deleteTask(at: indexPath)
    }
    
}


// MARK: TaskListTableViewHandlerOutput

    extension TaskListViewController: UIContextMenuInteractionDelegate {
        
        func didHighlightTask(at index: IndexPath) {
            output.didHighlightTask(at: index.row)
        }

        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                let editAction = UIAction(title: "Редактировать", image: UIImage(systemName: "pencil")) { _ in
                }
                
                let shareAction = UIAction(title: "Поделиться", image: UIImage(systemName: "square.and.arrow.up")) { _ in
                }
                
                let deleteAction = UIAction(title: "Удалить", image: UIImage(systemName: "trash"), attributes: .destructive) { [weak self] _ in
                    self?.output.didPressDeleteAction()
                }
                
                return UIMenu(title: "", children: [editAction, shareAction, deleteAction])
            }
        }
    }
