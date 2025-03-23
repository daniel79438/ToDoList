//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Daniel Harris on 22/03/2025.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    // Will allow us to find where our simulator is saved:
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
