//
//  DataController.swift
//  Milestone10-12
//
//  Created by Javier Rodríguez Gómez on 24/1/22.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Milestone1012")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
