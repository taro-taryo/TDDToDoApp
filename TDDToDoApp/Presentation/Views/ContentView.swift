//
//  ContentView.swift
//  TDDToDoApp
//
//  Created by taro-taryo on 2024/11/23
//
//
import SwiftUI

struct ContentView: View {
  @State private var todos: [ToDo] = [
    ToDo(id: UUID(), title: "Sample Task 1", isCompleted: false),
    ToDo(id: UUID(), title: "Sample Task 2", isCompleted: true),
  ]

  var body: some View {
    NavigationView {
      List(todos, id: \.id) { todo in
        HStack {
          Text(todo.title)
          Spacer()
          if todo.isCompleted { Image(systemName: "checkmark.circle.fill").foregroundColor(.green) }
        }
      }
      .navigationTitle("ToDos")
    }
  }
}

#Preview { ContentView() }
