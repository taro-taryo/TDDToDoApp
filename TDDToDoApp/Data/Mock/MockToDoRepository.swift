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

  private func log(action: String, detail: String = "") {
    print("[MockToDoRepository] \(action)\(detail.isEmpty ? "" : ": \(detail)")")
  }

  func fetchToDos() -> [ToDo] {
    log(action: "Fetching ToDos")
    return todos
  }

  func addToDo(_ todo: ToDo) {
    log(action: "Adding ToDo", detail: todo.title)
    todos.append(todo)
  }

  func deleteToDo(id: UUID) {
    log(action: "Deleting ToDo", detail: "ID \(id)")
    todos.removeAll { $0.id == id }
  }

  func toggleToDoCompletion(id: UUID) {
    guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
    todos[index].isCompleted.toggle()
    log(action: "Toggled ToDo completion", detail: "ID \(id)")
  }
}
