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
    
//    private var titleLabel: UILabel?
//
//    private var headerHeightConstraint: NSLayoutConstraint?
//    private var titleBottomConstraint: NSLayoutConstraint?
    
//    private var view: UIView?
    
//    init(titleLabel: UILabel, view: UIView) {
//        super.init()
//
//        self.titleLabel = titleLabel
//        self.view = view
//    }
    
//    func setupConstraints(
//        headerHeightConstraint: NSLayoutConstraint,
//        titleBottomConstraint: NSLayoutConstraint) {
//        self.headerHeightConstraint = headerHeightConstraint
//        self.titleBottomConstraint = titleBottomConstraint
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row\(indexPath.row)"
        
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
