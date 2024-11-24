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
  func testAddToDo() {
    let repository = MockToDoRepository()
    let commandService = ToDoCommandService(repository: repository)
    let queryService = ToDoQueryService(repository: repository)

    // 初期状態の確認
    XCTAssertEqual(queryService.fetchToDos().count, 0)

    // ToDoを追加
    commandService.addToDo(title: "Sample Task")
    XCTAssertEqual(queryService.fetchToDos().count, 1)
  }
}
