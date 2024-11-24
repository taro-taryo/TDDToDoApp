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
    XCTAssertEqual(queryService.fetchToDos().count, 1)
  }

  func testToggleToDoCompletion() {
    let repository = MockToDoRepository()
    let commandService = ToDoCommandService(repository: repository)
    let queryService = ToDoQueryService(repository: repository)

    // ToDoを追加
    commandService.addToDo(title: "Sample Task")
    XCTAssertEqual(queryService.fetchToDos().count, 1)

    // 初期状態を確認
    guard let todo = queryService.fetchToDos().first else {
      XCTFail("ToDoが存在しません")
      return
    }
    XCTAssertFalse(todo.isCompleted, "初期状態でisCompletedがfalseであるべき")

    // 完了状態を切り替え
    commandService.toggleToDoCompletion(id: todo.id)
    guard let updatedTodo = queryService.fetchToDos().first else {
      XCTFail("ToDoが更新されません")
      return
    }
    XCTAssertTrue(updatedTodo.isCompleted, "完了状態が切り替わっていない")

    // 再度切り替え
    commandService.toggleToDoCompletion(id: updatedTodo.id)
    guard let revertedTodo = queryService.fetchToDos().first else {
      XCTFail("ToDoが再更新されません")
      return
    }
    XCTAssertFalse(revertedTodo.isCompleted, "完了状態が元に戻っていない")
  }
}
