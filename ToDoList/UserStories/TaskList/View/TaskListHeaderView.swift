//
//  TaskListHeaderView.swift
//  ToDoList
//
//  Created by Савва on 08.02.2025.
//

import Foundation
import UIKit

class TaskListHeaderView: UIView {
    private let tableView = UITableView()
    
    private var headerView: UIView!
    private var titleLabel: UILabel!
    
    private let maxHeaderHeight: CGFloat = 200
    private let minHeaderHeight: CGFloat = 80
    
    private func setupTableHeaderView() {
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: maxHeaderHeight))
        
        titleLabel = UILabel()
        titleLabel.text = TaskListConstants.headerTitle
        titleLabel.font = TaskListConstants.headerFont
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20)
        ])
        
        tableView.tableHeaderView = headerView
    }
    
}
