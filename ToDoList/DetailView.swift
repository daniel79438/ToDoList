//
//  DetailView.swift
//  ToDoList
//
//  Created by Daniel Harris on 22/03/2025.
//

import SwiftUI

struct DetailView: View {
    @State var toDo: String
    @State private var reminderIsOn: Bool = false
//    @State private var dueDate: Date = Date.now + 60*60*24
    @State private var dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
    @State private var notes = ""
    @State private var isCompleted = false

    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List{
            TextField("Enter To Do Here", text: $toDo)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            
            Toggle("Set Reminder: ", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date:", selection: $dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!reminderIsOn)
            
            Text("Notes:")
                .padding(.top)
            
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed", isOn: $isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //TODO: Add Save Code Here
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
    DetailView(toDo: "")
    }
}
