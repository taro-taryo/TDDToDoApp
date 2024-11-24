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

  private func log(_ message: String) { print("[MockToDoRepository] \(message)") }

  func fetchToDos() -> [ToDo] {
    log("Fetching ToDos")
    return todos
  }

  func addToDo(_ todo: ToDo) {
    log("Adding ToDo \(todo.title)")
    todos.append(todo)
  }

  func deleteToDo(id: UUID) {
    log("Deleting ToDo with ID \(id)")
    todos.removeAll { $0.id == id }
  }
}
