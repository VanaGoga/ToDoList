//
//  ServiceResponse.swift
//  ToDoList
//
//  Created by Савва on 12.02.2025.
//

import Foundation

enum ServiceResponse<T> {
    
    case success(result: T)
    case error(error: Error)
    
}
