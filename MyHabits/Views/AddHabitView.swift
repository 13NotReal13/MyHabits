//
//  AddHabitView.swift
//  MyHabits
//
//  Created by Иван Семикин on 09/10/2024.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var storageManager: StorageManager
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    let newHabit = Habit(title: title, description: description, completionCount: 0)
                    storageManager.habits.append(newHabit)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddHabitView(storageManager: StorageManager())
}
