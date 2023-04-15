//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Javier Rodríguez Gómez on 27/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var numOfPlays = 0
    @State private var showingEnd = false
    
    @State private var spinAmount = 0.0
    @State private var buttonTapped = -1
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                spinAmount += 360
                                opacity = 0.25
                                flagTapped(number)
                                buttonTapped = number
                            }
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                        .opacity(buttonTapped == number ? 1 : opacity)
                        .rotation3DEffect(buttonTapped == number ? .degrees(spinAmount) : .degrees(0), axis: (x: 0, y: 1, z: 0))
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game over", isPresented: $showingEnd) {
            Button("Play again", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        numOfPlays += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        buttonTapped = -1
        opacity = 1.0
        if numOfPlays == 8 {
            showingEnd = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func resetGame() {
        numOfPlays = 0
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
