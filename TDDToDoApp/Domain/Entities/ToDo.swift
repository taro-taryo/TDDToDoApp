//
//  ToDo.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//

import Foundation

struct ToDo {
  let id: UUID
  var title: String
  var isCompleted: Bool
  var isImportant: Bool = false
}
