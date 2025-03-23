//
//  ToDoList.swift
//  ToDoList
//
//  Created by Daniel Harris on 22/03/2025.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Swift",
                 "Build an App",
                 "Change the World",
                 "Bring the Awesome",
                 "Take a Vacation"]
    @State private var sheetIsPresented = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(toDos, id: \.self){ toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo)
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}
