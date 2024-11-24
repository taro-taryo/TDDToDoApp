//
//  ToDoRepository.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//

protocol ToDoRepository {
  func fetchToDos() -> [ToDo]
  func addToDo(_ todo: ToDo)
}
