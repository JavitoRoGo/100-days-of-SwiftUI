//
//  AddHabit.swift
//  Milestone7-9
//
//  Created by Javier Rodríguez Gómez on 16/1/22.
//

import SwiftUI

struct AddHabit: View {
    @EnvironmentObject var model: HabitModel
    @State private var name = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button("Add") {
                    if !name.isEmpty && !description.isEmpty {
                        let new = Habit(name: name, description: description, completion: 0)
                        model.habits.append(new)
                        dismiss()
                    }
                }
            }
            .padding()
            Form {
                Section {
                    TextField("Enter your new activity", text: $name)
                }
                Section {
                    TextField("Enter a short description", text: $description)
                }
            }
        }
        .disableAutocorrection(true)
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit()
            .environmentObject(HabitModel())
    }
}
