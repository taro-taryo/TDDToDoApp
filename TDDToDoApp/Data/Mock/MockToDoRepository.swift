//
//  MockToDoRepository.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//

final class MockToDoRepository: ToDoRepository {

  private var todos: [ToDo] = []

  func fetchToDos() -> [ToDo] { return todos }

  func addToDo(_ todo: ToDo) { todos.append(todo) }
}
