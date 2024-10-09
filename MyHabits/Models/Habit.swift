//
//  Habit.swift
//  MyHabits
//
//  Created by Иван Семикин on 09/10/2024.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completionCount: Int
}
