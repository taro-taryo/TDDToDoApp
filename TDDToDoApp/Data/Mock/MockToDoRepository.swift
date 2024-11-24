//
//  MockToDoRepository.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//

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
}
