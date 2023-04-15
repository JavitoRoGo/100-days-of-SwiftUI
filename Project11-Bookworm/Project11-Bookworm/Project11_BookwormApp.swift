//
//  Project11_BookwormApp.swift
//  Project11-Bookworm
//
//  Created by Javier Rodríguez Gómez on 21/1/22.
//

import SwiftUI

@main
struct Project11_BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
