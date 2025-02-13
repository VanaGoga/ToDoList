//
//  TaskListTableViewDelegate.swift
//  ToDoList
//
//  Created by Савва on 08.02.2025.
//

import Foundation
import UIKit


protocol TaskListTableViewHandlerOutput: UIContextMenuInteractionDelegate {

    func didHighlightTask(at index: IndexPath)
    func didSelectTask(at index: IndexPath)
    
}

class TaskListTableViewHandler: NSObject, UITableViewDelegate {
    
    private let minHeaderHeight: CGFloat = 80
    private let maxHeaderHeight: CGFloat = 188
    weak var tableView: UITableView?
    weak var output: TaskListTableViewHandlerOutput?
    
    private var tasks: [Task] = []

    func setupInitialState(with tableView: UITableView, output: TaskListTableViewHandlerOutput?) {
        self.tableView = tableView
        self.output = output
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: "TaskListTableViewCell")
    }
    
    func show(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func deleteTask(at indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView?.deleteRows(at: [indexPath], with: .fade)
    }
    
    func changeTask(at indexPath: IndexPath, task: Task) {
        tasks[indexPath.row] = task
        tableView?.reloadRows(at: [indexPath], with: .fade)
    }

}

// MARK: UITableViewDataSource

extension TaskListTableViewHandler: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath) as? TaskListTableViewCell
        else { return UITableViewCell() }
        
        cell.cellDelegate = output
        cell.configure(with: tasks[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        output?.didHighlightTask(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectTask(at: indexPath)
    }

}
