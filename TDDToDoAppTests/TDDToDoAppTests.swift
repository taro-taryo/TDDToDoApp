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

  // ToDoを削除する機能のテスト
  func testDeleteToDo() {
    let repository = MockToDoRepository()
    let commandService = ToDoCommandService(repository: repository)
    let queryService = ToDoQueryService(repository: repository)

    // 2つのToDoを追加
    commandService.addToDo(title: "Sample Task 1")
    commandService.addToDo(title: "Sample Task 2")
    XCTAssertEqual(queryService.fetchToDos().count, 2, "ToDoの数が2つであるべき")

    // 最初のToDoを削除
    if let todoToDelete = queryService.fetchToDos().first {
      commandService.deleteToDo(id: todoToDelete.id)
    }
    XCTAssertEqual(queryService.fetchToDos().count, 1, "ToDoが1つ削除され、残り1つであるべき")
  }

  // ToDoの完了状態を切り替える機能のテスト
  func testToggleToDoCompletion() {
    let repository = MockToDoRepository()
    let commandService = ToDoCommandService(repository: repository)
    let queryService = ToDoQueryService(repository: repository)

    // ToDoを追加
    commandService.addToDo(title: "Sample Task")
    XCTAssertEqual(queryService.fetchToDos().count, 1, "ToDoが1つ追加されているべき")

    // 追加されたToDoの完了状態を確認 (初期状態は未完了)
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

    // 再び完了状態を切り替え
    commandService.toggleToDoCompletion(id: updatedTodo.id)
    guard let revertedTodo = queryService.fetchToDos().first else {
      XCTFail("ToDoが再更新されません")
      return
    }
    XCTAssertFalse(revertedTodo.isCompleted, "完了状態が元に戻っていない")
  }

  // ToDoを重要マークする機能のテスト
  func testMarkToDoAsImportant() {
    let repository = MockToDoRepository()
    let commandService = ToDoCommandService(repository: repository)
    let queryService = ToDoQueryService(repository: repository)

    // ToDoを追加
    commandService.addToDo(title: "Important Task")
    XCTAssertEqual(queryService.fetchToDos().count, 1, "ToDoが1つ追加されているべき")

    // 追加されたToDoを取得し、重要マークが初期状態でfalseであることを確認
    guard let todo = queryService.fetchToDos().first else {
      XCTFail("ToDoが存在しません")
      return
    }
    XCTAssertFalse(todo.isImportant, "初期状態でisImportantがfalseであるべき")

    // 重要マークを設定
    commandService.markAsImportant(id: todo.id)
    guard let updatedTodo = queryService.fetchToDos().first else {
      XCTFail("重要フラグが切り替わったToDoが取得できません")
      return
    }
    XCTAssertTrue(updatedTodo.isImportant, "重要フラグが正しく切り替わっていない")
  }
}
