//
//  Milestone16_18App.swift
//  Milestone16-18
//
//  Created by Javier Rodríguez Gómez on 8/2/22.
//

import SwiftUI

@main
struct Milestone16_18App: App {
    @StateObject var model = RolledModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RolledModel())
        }
    }
}
