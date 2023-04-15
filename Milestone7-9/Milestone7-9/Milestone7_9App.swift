//
//  Milestone7_9App.swift
//  Milestone7-9
//
//  Created by Javier Rodríguez Gómez on 15/1/22.
//

import SwiftUI

@main
struct Milestone7_9App: App {
    @StateObject var model = HabitModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HabitModel())
        }
    }
}
