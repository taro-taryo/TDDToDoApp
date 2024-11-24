//
//  MockToDoRepository.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//

import Foundation

final class MockToDoRepository: ToDoRepository {
  private var todos: [ToDo] = []

  func fetchToDos() -> [ToDo] {
    print("Mock: Fetching ToDos")
    return todos
  }

  func addToDo(_ todo: ToDo) {
    print("Mock: Adding ToDo \(todo.title)")
    todos.append(todo)
  }

  func deleteToDo(id: UUID) {
    print("Mock: Deleting ToDo with ID \(id)")
    todos.removeAll { $0.id == id }
  }
}
