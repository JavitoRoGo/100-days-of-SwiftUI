//
//  Model.swift
//  Milestone7-9
//
//  Created by Javier Rodríguez Gómez on 15/1/22.
//

import Foundation

struct Habit: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var completion: Int
}

final class HabitModel: ObservableObject {
    @Published var habits: [Habit] = [Habit(name: "Learning a language", description: "Learning from zero or just improving the language level.", completion: 0), Habit(name: "Practicing an instrument", description: "Practicing to play a musical instrument.", completion: 0), Habit(name: "Reading a book", description: "Having a relaxing reading session.", completion: 0)] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                habits = decoded
            }
        }
    }
}
