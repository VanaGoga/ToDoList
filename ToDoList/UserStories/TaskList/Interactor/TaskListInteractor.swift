//
//  TaskListInteractor.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import Foundation

class TaskListInteractor: TaskListInteractorInput {

    weak var output: TaskListInteractorOutput!
    
    func getTaskList() {
        let tasks = [
            Task(title: "Купить продукты", details: "Купить хлеб, молоко, яйца", date: Date(), isCompleted: false),
            Task(title: "Сделать зарядку", details: "15 минут кардио + растяжка", date: Date(), isCompleted: true),
            Task(title: "Подготовить отчет", details: "Финальный отчет по проекту", date: Date(), isCompleted: false)
        ]
        
        output.didLoad(tasks: tasks)
    }

}
