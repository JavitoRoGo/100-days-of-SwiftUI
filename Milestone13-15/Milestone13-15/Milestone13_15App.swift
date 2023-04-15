//
//  Milestone13_15App.swift
//  Milestone13-15
//
//  Created by Javier Rodríguez Gómez on 1/2/22.
//

import SwiftUI

@main
struct Milestone13_15App: App {
    @StateObject var model = MyThingModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MyThingModel())
        }
    }
}
