//
//  ToDoQueryService.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/24
//
//

import Foundation

class ToDoQueryService {
  private let repository: ToDoRepository

  init(repository: ToDoRepository) { self.repository = repository }

  func fetchToDos() -> [ToDo] { return repository.fetchToDos() }
}
