//
//  ContentView.swift
//  Milestone4-6
//
//  Created by Javier Rodríguez Gómez on 8/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var gameIsActive = false
    @State private var tableSelection = 0
    var tableToCalculate: Int {
        tableSelection + 2
    }
    let numOfQuestions = [5, 10, 20]
    @State private var questionSelection = 5
    let numbers = [2,4,17,9,3,12,15,5,8,1,10,14,20,6,13,19,7,11,16,18]
    @State private var answers = [Int](repeating: 0, count: 20)
    @State private var result = 0
    @State private var showingResults = false
    
    var body: some View {
        VStack {
            Text("Multiplication tables practice")
                .font(.title)
            if !gameIsActive {
                Form {
                    Section {
                        Text("Select which table you want to practice:")
                            .font(.title2)
                        Picker("table", selection: $tableSelection) {
                            ForEach(2..<13) {
                                Text(String($0))
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Section {
                        Text("Select the number of questions to solve:")
                            .font(.title2)
                        Picker("questions", selection: $questionSelection) {
                            ForEach(numOfQuestions, id: \.self) {
                                Text(String($0))
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .frame(height: 400)
                Button("PLAY!") {
                    gameIsActive = true
                }
                Spacer()
            } else {
                Text("These are your questions.")
                    .font(.title2)
                Text("Write your answer for each one.")
                    .font(.title3)
                List {
                    ForEach(0..<questionSelection) { index in
                        HStack {
                            Text("\(index + 1).-")
                                .font(.title2)
                            Spacer()
                            Image(systemName: "\(tableToCalculate).square")
                            Spacer()
                            Image(systemName: "multiply")
                            Spacer()
                            Image(systemName: "\(numbers[index]).circle")
                            Spacer()
                            Image(systemName: "equal")
                            HStack {
                                Spacer()
                                Spacer()
                                TextField("", value: $answers[index], format: .number)
                                    .keyboardType(.numberPad)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 75)
                            }
                        }
                        .font(.largeTitle)
                    }
                }
                .frame(height: 600)
                Button("SOLVE!") {
                    for i in 0..<questionSelection {
                        if answers[i] == tableToCalculate * numbers[i] {
                            result += 1
                        }
                    }
                    showingResults = true
                }
                Spacer()
            }
        }
        .alert("Your score is \(result).", isPresented: $showingResults) {
            Button("Play again") {
                result = 0
                tableSelection = 0
                questionSelection = 5
                answers = [Int](repeating: 0, count: 20)
                gameIsActive = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
