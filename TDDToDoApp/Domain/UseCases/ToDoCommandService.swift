//
//  ToDoCommandService.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/24
//
//

import Foundation

class ToDoCommandService {
  private let repository: ToDoRepository

  init(repository: ToDoRepository) { self.repository = repository }

  func addToDo(title: String) {
    let newToDo = ToDo(id: UUID(), title: title, isCompleted: false)
    repository.addToDo(newToDo)
  }

  func deleteToDo(id: UUID) { repository.deleteToDo(id: id) }
}
