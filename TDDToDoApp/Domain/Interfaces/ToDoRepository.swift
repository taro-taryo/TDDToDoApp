//
//  ToDoRepository.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//

import Foundation

protocol ToDoRepository {
  func fetchToDos() -> [ToDo]
  func addToDo(_ todo: ToDo)
  func deleteToDo(id: UUID)
  func toggleToDoCompletion(id: UUID)
}
