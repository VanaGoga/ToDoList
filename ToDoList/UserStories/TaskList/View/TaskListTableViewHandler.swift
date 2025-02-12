//
//  TaskListTableViewDelegate.swift
//  ToDoList
//
//  Created by Савва on 08.02.2025.
//

import Foundation
import UIKit


protocol TaskListTableViewHandlerOutput: AnyObject {
    
    func showActions(for index: IndexPath)
    
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


//    // MARK: - UIScrollViewDelegate
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//        print("y offset = \(scrollView.contentOffset.y)")
//        
//        let offsetY = max(scrollView.contentOffset.y, -60)
//        let newHeight = max(maxHeaderHeight - offsetY, minHeaderHeight)
//        
//        // Изменяем высоту заголовка
//        headerHeightConstraint?.constant = newHeight
//        
//        // Обновляем положение текста
//        let titleScale = (newHeight - minHeaderHeight) / (maxHeaderHeight - minHeaderHeight)
//        titleLabel?.font = UIFont.boldSystemFont(ofSize: 32 * titleScale)
//        titleBottomConstraint?.constant = -20 * titleScale
//        
//        // Анимация изменений
//        UIView.animate(withDuration: 0.1) {
//            self.view?.layoutIfNeeded()
//        }
//    }
    

}

// MARK: UITableViewDataSource

extension TaskListTableViewHandler: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath) as? TaskListTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(with: tasks[indexPath.row])
        cell.onLongPress = { [weak self] in
            self?.output?.showActions(for: indexPath)
        }
        
        return cell
    }

}
