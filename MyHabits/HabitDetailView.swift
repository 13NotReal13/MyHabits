//
//  HabitDetailView.swift
//  MyHabits
//
//  Created by Иван Семикин on 09/10/2024.
//

import SwiftUI

struct HabitDetailView: View {
    var habit: Habit
    var storageManager: StorageManager
    
    var body: some View {
        VStack {
            Text(habit.description)
            
            Text("Times completed: \(habit.completionCount)")
            
            Button("Mark as Completed") {
                if let index = storageManager.habits.firstIndex(of: habit) {
                    var updatedHabit = habit
                    updatedHabit.completionCount += 1
                    storageManager.habits[index] = updatedHabit
                }
            }
            .padding()
        }
        .navigationTitle(habit.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HabitDetailView(
        habit: Habit(title: "First habit", description: "Something here", completionCount: 2),
        storageManager: StorageManager()
    )
}
