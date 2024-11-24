//
//  TDDToDoAppTests.swift
//  TDDToDoAppTests
//
//  Created by taro-taryo on 2024/11/23
//
//

import XCTest

@testable import TDDToDoApp

final class TDDToDoAppTests: XCTestCase {
  func testDeleteToDo() {
    let repository = MockToDoRepository()
    let commandService = ToDoCommandService(repository: repository)
    let queryService = ToDoQueryService(repository: repository)

    // 初期状態の確認
    commandService.addToDo(title: "Sample Task 1")
    commandService.addToDo(title: "Sample Task 2")
    XCTAssertEqual(queryService.fetchToDos().count, 2)

    // ToDoを削除
    if let todoToDelete = queryService.fetchToDos().first {
      commandService.deleteToDo(id: todoToDelete.id)
    }

    // 削除後の確認
    XCTAssertEqual(queryService.fetchToDos().count, 1)
  }
}
