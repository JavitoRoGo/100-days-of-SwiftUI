//
//  FilteredList.swift
//  Project12-CoreDataProject
//
//  Created by Javier Rodríguez Gómez on 23/1/22.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    enum MyPredicates: String {
        case beginsWith = "BEGINSWITH"
        case contains = "CONTAINS"
    }
    
    let sortArray = [
        SortDescriptor<T>
    ]()
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, predicate: MyPredicates, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortArray, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
