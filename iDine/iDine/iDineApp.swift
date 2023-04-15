//
//  iDineApp.swift
//  iDine
//
//  Created by Javier Rodríguez Gómez on 8/12/22.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
