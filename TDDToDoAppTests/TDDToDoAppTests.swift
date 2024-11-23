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
        // 初期状態の確認
        let repository = MockToDoRepository()
        let useCase = ToDoUseCase(repository: repository)
        XCTAssertEqual(useCase.fetchToDos().count, 0)

        // ToDoを追加
        useCase.addToDo(title: "Sample Task")
        XCTAssertEqual(useCase.fetchToDos().count, 1)
    }
}
