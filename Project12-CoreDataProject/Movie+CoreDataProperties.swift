//
//  Movie+CoreDataProperties.swift
//  Project12-CoreDataProject
//
//  Created by Javier Rodríguez Gómez on 22/1/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String
    @NSManaged public var director: String
    @NSManaged public var year: Int16

}

extension Movie : Identifiable {

}
