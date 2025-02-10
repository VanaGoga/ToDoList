//
//  TaskListTableViewDelegate.swift
//  ToDoList
//
//  Created by Савва on 08.02.2025.
//

import Foundation
import UIKit

class TaskListTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private let minHeaderHeight: CGFloat = 80
    private let maxHeaderHeight: CGFloat = 188
    
    private var tasks: [Task] = [
        Task(title: "Купить продукты", details: "Купить хлеб, молоко, яйца", date: Date(), isCompleted: false),
        Task(title: "Сделать зарядку", details: "15 минут кардио + растяжка", date: Date(), isCompleted: true),
        Task(title: "Подготовить отчет", details: "Финальный отчет по проекту", date: Date(), isCompleted: false)
    ]

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return tasks.count }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { guard let cell =tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else { return UITableViewCell() } cell.configure(with: tasks[indexPath.row]) return cell }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath) as? TaskListTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(with: tasks[indexPath.row])
        
        return cell
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
