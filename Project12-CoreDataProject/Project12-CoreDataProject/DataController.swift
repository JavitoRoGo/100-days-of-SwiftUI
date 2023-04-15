//
//  DataController.swift
//  Project12-CoreDataProject
//
//  Created by Javier Rodríguez Gómez on 22/1/22.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
