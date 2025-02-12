//
//  TaskListInteractor.swift
//  ToDoList
//
//  Created by Савва on 07.02.2025.
//

import Foundation
import CoreData

class TaskListInteractor: TaskListInteractorInput {

    var service: TodoListServiceInput!
    weak var output: TaskListInteractorOutput!
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Ошибка загрузки Core Data: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func getTaskList() {
        if let cachedTasks = fetchTasksFromCoreData(), !cachedTasks.isEmpty {
            output.didLoad(tasks: cachedTasks)
        } else {
            service.loadTasks { [weak self] response in
                guard let self = self else { return }
                
                switch response {
                case let .success(result):
                    self.output.didLoad(tasks: result)
                    
                    self.saveTasksToCoreData(result)
                case let .error(_): break
                }
            }
        }
    }
    
    func fetchTasksFromCoreData() -> [Task]? {
        let fetchRequest: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        do {
            let taskEntities = try context.fetch(fetchRequest)
            return taskEntities.map { Task(title: $0.title ?? "", details: $0.details ?? "", date: $0.date ?? Date(), isCompleted: $0.isCompeted) }
            
        } catch { return nil }
    }

    private func saveTasksToCoreData(_ tasks: [Task]) {
        tasks.forEach { todo in
            let taskEntity = TaskEntity(context: context)
            taskEntity.title = todo.title
            taskEntity.details = todo.details
            taskEntity.date = todo.date
            taskEntity.isCompeted = todo.isCompleted
        }
        
        do {
            try context.save()
            print("Данные сохранены в Core Data")
        } catch {
            print("Ошибка сохранения в Core Data: \(error)")
        }
    }
    
}
