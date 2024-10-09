//
//  ContentView.swift
//  MyHabits
//
//  Created by Иван Семикин on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var storageManager = StorageManager()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(storageManager.habits) { habit in
                    NavigationLink(destination: HabitDetailView(habit: habit, storageManager: storageManager)) {
                        VStack(alignment: .leading) {
                            Text(habit.title)
                                .font(.headline)
                            Text(habit.description)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showingAddActivity = true
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddHabitView(storageManager: storageManager)
            }
        }
    }
}

#Preview {
    ContentView()
}
