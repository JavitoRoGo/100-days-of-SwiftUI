//
//  ContentView.swift
//  Milestone7-9
//
//  Created by Javier Rodríguez Gómez on 15/1/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: HabitModel
    @State private var showingNewHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.habits) { habit in
                    let index = model.habits.firstIndex(of: habit)!
                    NavigationLink(destination: DetailView(habit: $model.habits[index])) {
                        HStack {
                            Text(habit.name)
                                .font(.headline)
                            Spacer()
                            Text(habit.completion, format: .number)
                                .font(.title3)
                        }
                    }
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("Habit tracking")
            .toolbar {
                Button("New habit") {
                    showingNewHabit = true
                }
            }
            .sheet(isPresented: $showingNewHabit) {
                AddHabit()
            }
        }
    }
    
    func deleteRow(at offsets: IndexSet) {
        model.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HabitModel())
    }
}
