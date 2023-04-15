//
//  Project12_CoreDataProjectApp.swift
//  Project12-CoreDataProject
//
//  Created by Javier Rodríguez Gómez on 22/1/22.
//

import SwiftUI

@main
struct Project12_CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
