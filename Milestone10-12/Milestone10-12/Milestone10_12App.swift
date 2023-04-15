//
//  Milestone10_12App.swift
//  Milestone10-12
//
//  Created by Javier Rodríguez Gómez on 23/1/22.
//

import SwiftUI

@main
struct Milestone10_12App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
