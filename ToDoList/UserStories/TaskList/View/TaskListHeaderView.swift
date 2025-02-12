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
    
    private var titleLabel: UILabel!
    private var searchContainer: UIView!
    private var searchIcon: UIImageView!
    private var searchTextField: UITextField!
    private var microphoneButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        titleLabel = UILabel()
        titleLabel.text = TaskListConstants.headerTitle
        titleLabel.font = TaskListConstants.headerFont
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        
        searchContainer = UIView()
        searchContainer.backgroundColor = .gray
        searchContainer.layer.cornerRadius = 10
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.layer.masksToBounds = true
        
        addSubview(searchContainer)
        
        // Иконка лупы
        searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = .lightGray
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.addSubview(searchIcon)
        
        searchTextField = UITextField()
        searchTextField.attributedPlaceholder = NSAttributedString(
                string: "Поиск",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
            )
        
        searchTextField.textColor = .lightGray
        searchTextField.font = UIFont.systemFont(ofSize: 16)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.addSubview(searchTextField)
        
        microphoneButton = UIButton(type: .system)
        microphoneButton.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        microphoneButton.tintColor = .lightGray
        microphoneButton.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.addSubview(microphoneButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            searchContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            searchContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchContainer.heightAnchor.constraint(equalToConstant: 40),
            
            searchIcon.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 10),
            searchIcon.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            searchTextField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10),
            searchTextField.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: microphoneButton.leadingAnchor, constant: -10),
            
            microphoneButton.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10),
            microphoneButton.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
            microphoneButton.widthAnchor.constraint(equalToConstant: 25),
                        microphoneButton.heightAnchor.constraint(equalToConstant: 25),
            microphoneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
    
}
