//
//  FriendInCD+CoreDataProperties.swift
//  Milestone10-12
//
//  Created by Javier Rodríguez Gómez on 24/1/22.
//
//

import Foundation
import CoreData


extension FriendInCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendInCD> {
        return NSFetchRequest<FriendInCD>(entityName: "FriendInCD")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: UserInCD?
    
    public var wrappedID: String {
        id ?? "No id"
    }
    public var wrappedName: String {
        name ?? "No name"
    }

}

extension FriendInCD : Identifiable {

}
