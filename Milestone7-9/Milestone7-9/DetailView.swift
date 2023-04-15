//
//  DetailView.swift
//  Milestone7-9
//
//  Created by Javier Rodríguez Gómez on 16/1/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var habit: Habit
    
    var body: some View {
        VStack {
            Text(habit.description)
                .font(.title)
                .padding()
            Divider()
            Text("You have completed this activity...")
                .font(.title2)
            Text("Completion count:")
                .font(.title2)
            HStack {
                Text(habit.completion, format: .number)
                    .font(.largeTitle)
                .padding()
                Stepper("", value: $habit.completion, in: 0...999999)
                    .labelsHidden()
            }
            Spacer()
        }
        .padding()
        .navigationTitle(habit.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habit: .constant(HabitModel().habits[0]))
            .environmentObject(HabitModel())
    }
}
