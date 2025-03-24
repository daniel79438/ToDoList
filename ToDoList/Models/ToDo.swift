//
//  ToDo.swift
//  ToDoList
//
//  Created by Daniel Harris on 23/03/2025.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
    var item: String = ""
    var reminderIsOn: Bool = false
    var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
    var notes: String = ""
    var isCompleted: Bool = false

    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
}

extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(ToDo(item: "Create SwiftData Lessons", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Now with iOS 16 and Xcode 18", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Macedonian Educators Talk", reminderIsOn: true, dueDate: Date.now + 60*60*44, notes: "They want to learn entrepeneurship", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Post Flyers for Swift in Santiago", reminderIsOn: true, dueDate: Date.now + 60*60*72, notes: "To be held at UAH in Chile", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Prepare old iPhone for Lilly", reminderIsOn: true, dueDate: Date.now + 60*60*12, notes: "She gets my old Pro", isCompleted: false))

        return container
    }
}


