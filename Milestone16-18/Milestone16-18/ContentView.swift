//
//  ContentView.swift
//  Milestone16-18
//
//  Created by Javier Rodríguez Gómez on 8/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: RolledModel
    
    @State private var numD4 = 0
    @State private var numD6 = 0
    @State private var numD8 = 0
    @State private var numD10 = 0
    @State private var numD12 = 0
    @State private var numD20 = 0
    @State private var numD100 = 0
    @State private var total = 0
    @State private var showingViewAll = false
    
    @State private var feedback = UINotificationFeedbackGenerator()
    let timer = Timer.publish(every: 0.5, on: .main, in: .common)
    @State private var counter = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        VStack {
                            Text("D4")
                                .font(.title3)
                            Text("\(numD4)")
                                .font(.title)
                            Stepper("D4", value: $numD4, in: 0...10).labelsHidden()
                        }
                        .frame(width: 100, height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                        VStack {
                            Text("D6")
                                .font(.title3)
                            Text("\(numD6)")
                                .font(.title)
                            Stepper("D6", value: $numD6, in: 0...10).labelsHidden()
                        }
                        .frame(width: 100, height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                        VStack {
                            Text("D8")
                                .font(.title3)
                            Text("\(numD8)")
                                .font(.title)
                            Stepper("D8", value: $numD8, in: 0...10).labelsHidden()
                        }
                        .frame(width: 100, height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                    }
                    HStack(spacing: 20) {
                        VStack {
                            Text("D10")
                                .font(.title3)
                            Text("\(numD10)")
                                .font(.title)
                            Stepper("D10", value: $numD10, in: 0...10).labelsHidden()
                        }
                        .frame(width: 100, height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                        VStack {
                            Text("D12")
                                .font(.title3)
                            Text("\(numD12)")
                                .font(.title)
                            Stepper("D12", value: $numD12, in: 0...10).labelsHidden()
                        }
                        .frame(width: 100, height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                        VStack {
                            Text("D20")
                                .font(.title3)
                            Text("\(numD20)")
                                .font(.title)
                            Stepper("D20", value: $numD20, in: 0...10).labelsHidden()
                        }
                        .frame(width: 100, height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                    }
                    HStack(spacing: 20) {
                        VStack {
                            Text("D100")
                                .font(.title3)
                            Text("\(numD100)")
                                .font(.title)
                            Stepper("D100", value: $numD100, in: 0...10).labelsHidden()
                        }
                        .frame(width: 100, height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        )
                    }
                    Button("Reset all") {
                        resetAll()
                    }
                }
                .onTapGesture {
                    feedback.prepare()
                }
                Spacer()
                Text(total, format: .number)
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .frame(width: 90, height: 90)
                    .background(.tertiary)
                    .clipShape(Circle())
                Spacer()
                Button("Roll!") {
//                    roll()
//                    saveToList()
                    timer.autoconnect()
                }
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(.blue)
                .clipShape(Capsule())
            }
            .navigationTitle("Roll the dice")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("View all") {
                        showingViewAll = true
                    }
                }
            }
            .sheet(isPresented: $showingViewAll) {
                ListView()
            }
        }
        .onReceive(timer) { time in
            withAnimation {
            if counter == 5 {
                timer.connect().cancel()
                saveToList()
                feedback.notificationOccurred(.success)
            } else {
                roll()
                counter += 1
            }
            }
        }
    }
    
    func roll() {
        var totalD4 = 0
        var totalD6 = 0
        var totalD8 = 0
        var totalD10 = 0
        var totalD12 = 0
        var totalD20 = 0
        var totalD100 = 0
        
        if numD4 > 0 {
            for _ in 1...numD4 {
                totalD4 += Int.random(in: 1...4)
            }
        }
        if numD6 > 0 {
            for _ in 1...numD6 {
                totalD6 += Int.random(in: 1...6)
            }
        }
        if numD8 > 0 {
            for _ in 1...numD8 {
                totalD8 += Int.random(in: 1...8)
            }
        }
        if numD10 > 0 {
            for _ in 1...numD10 {
                totalD10 += Int.random(in: 1...10)
            }
        }
        if numD12 > 0 {
            for _ in 1...numD12 {
                totalD12 += Int.random(in: 1...12)
            }
        }
        if numD20 > 0 {
            for _ in 1...numD20 {
                totalD20 += Int.random(in: 1...20)
            }
        }
        if numD100 > 0 {
            for _ in 1...numD100 {
                totalD100 += Int.random(in: 1...100)
            }
        }
        
        total = totalD4 + totalD6 + totalD8 + totalD10 + totalD12 + totalD20 + totalD100
    }
    
    func resetAll() {
        numD4 = 0
        numD6 = 0
        numD8 = 0
        numD10 = 0
        numD12 = 0
        numD20 = 0
        numD100 = 0
        total = 0
    }
    
    func saveToList() {
        guard total > 0 else { return }
        
        var dice = ""
        if numD4 > 0 {
            dice += "\(numD4)D4-"
        }
        if numD6 > 0 {
            dice += "\(numD6)D6-"
        }
        if numD8 > 0 {
            dice += "\(numD8)D8-"
        }
        if numD10 > 0 {
            dice += "\(numD10)D10-"
        }
        if numD12 > 0 {
            dice += "\(numD12)D12-"
        }
        if numD20 > 0 {
            dice += "\(numD20)D20-"
        }
        if numD100 > 0 {
            dice += "\(numD100)D100"
        }
        
        let newRoll = Rolled(id: UUID(), dice: dice, roll: total)
        model.totalRolled.insert(newRoll, at: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RolledModel())
    }
}
