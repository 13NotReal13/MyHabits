//
//  StorageManager.swift
//  MyHabits
//
//  Created by Иван Семикин on 09/10/2024.
//

import Foundation
import SwiftUI

@Observable
final class StorageManager {
    @AppStorage("habits") var savedHabits: String = ""
    
    var habits: [Habit] {
        get {
            guard let data = savedHabits.data(using: .utf8) else { return [] }
            guard let decodedData = try? JSONDecoder().decode([Habit].self, from: data) else { return [] }
            
            return decodedData
        } set {
            guard let encodedData = try? JSONEncoder().encode(newValue) else { return }
            
            savedHabits = String(data: encodedData, encoding: .utf8) ?? ""
        }
    }
}
