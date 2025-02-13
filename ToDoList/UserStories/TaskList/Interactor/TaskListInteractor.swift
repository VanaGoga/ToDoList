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
    private var tasks: [TaskEntity] = []
    
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
                case .error(_): break
                }
            }
        }
    }
    
    func fetchTasksFromCoreData() -> [Task]? {
        let fetchRequest: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        do {
            let taskEntities = try context.fetch(fetchRequest)
            tasks = taskEntities
            return taskEntities.map { Task(title: $0.title ?? "", details: $0.details ?? "", date: $0.date ?? Date(), isCompleted: $0.isCompeted) }
            
        } catch { return nil }
    }
    
    func deleteTask(at index: Int) {
        let taskToDelete = tasks[index]
        context.delete(taskToDelete)
        
        do {
            try context.save()
            tasks.remove(at: index)
        } catch {
            print("Ошибка удаления задачи: \(error)")
        }
    }
    
    func changeTask(at index: Int, task: Task) {
        let taskToUpdate = tasks[index]
            
            // Обновляем задачу в Core Data
        taskToUpdate.title = task.title
        taskToUpdate.details = task.details
        taskToUpdate.date = task.date
        taskToUpdate.isCompeted = task.isCompleted
            
        do {
            try context.save()
        } catch {
            print("Ошибка при обновлении задачи: \(error)")
        }
        
    }

    private func saveTasksToCoreData(_ tasksArray: [Task]) {
        tasksArray.forEach { todo in
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
