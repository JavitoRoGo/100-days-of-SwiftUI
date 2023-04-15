//
//  ContentView.swift
//  Milestone1-3
//
//  Created by Javier Rodríguez Gómez on 28/12/21.
//

import SwiftUI

struct ContentView: View {
    let plays = ["rock", "paper", "scissors"]
    @State private var score = 0
    @State private var rounds = 0
    @State private var scoreMessage = ""
    @State private var appChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var showingResult = false
    @State private var showingEnd = false
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Your score is \(score)")
            Text("My move is: \(plays[appChoice])")
                .bold()
            Text(shouldWin ? "You should: Win" : "You should: Lose")
                .bold()
            Text("Select your choice:")
            HStack {
                ForEach(0..<3) { number in
                    Button(plays[number]) {
                        buttonTapped(number)
                    }
                    .font(.title)
                    .frame(width: 120, height: 70)
                    .background(.gray)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
        }
        .font(.title2)
        .alert(scoreMessage, isPresented: $showingResult) {
            Button("Continue", action: playAgain)
        }
        .alert("Game over", isPresented: $showingEnd) {
            Button("Play again", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func buttonTapped(_ number: Int) {
        rounds += 1
        if shouldWin {
            switch appChoice {
            case 0:
                if number == 1 {
                    score += 1
                    scoreMessage = "Correct"
                } else {
                    score -= 1
                    scoreMessage = "Wrong"
                }
            case 1:
                if number == 2 {
                    score += 1
                    scoreMessage = "Correct"
                } else {
                    score -= 1
                    scoreMessage = "Wrong"
                }
            default:
                if number == 0 {
                    score += 1
                    scoreMessage = "Correct"
                } else {
                    score -= 1
                    scoreMessage = "Wrong"
                }
            }
        } else {
            switch appChoice {
            case 0:
                if number == 2 {
                    score += 1
                    scoreMessage = "Correct"
                } else {
                    score -= 1
                    scoreMessage = "Wrong"
                }
            case 1:
                if number == 0 {
                    score += 1
                    scoreMessage = "Correct"
                } else {
                    score -= 1
                    scoreMessage = "Wrong"
                }
            default:
                if number == 1 {
                    score += 1
                    scoreMessage = "Correct"
                } else {
                    score -= 1
                    scoreMessage = "Wrong"
                }
            }
        }
        showingResult = true
    }
    
    func playAgain() {
        if rounds == 10 {
            showingEnd = true
        } else {
            appChoice = Int.random(in: 0...2)
            shouldWin.toggle()
        }
    }
    
    func resetGame() {
        rounds = 0
        score = 0
        playAgain()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
