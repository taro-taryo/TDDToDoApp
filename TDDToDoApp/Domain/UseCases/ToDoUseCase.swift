//
//  ToDoUseCase.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//

import Foundation

class ToDoUseCase {
  private let repository: ToDoRepository

  init(repository: ToDoRepository) { self.repository = repository }

  func fetchToDos() -> [ToDo] { return repository.fetchToDos() }

  func addToDo(title: String) {
    let newToDo = ToDo(id: UUID(), title: title, isCompleted: false)
    repository.addToDo(newToDo)
  }
}
