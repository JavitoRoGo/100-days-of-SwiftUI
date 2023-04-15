//
//  UserInCD+CoreDataProperties.swift
//  Milestone10-12
//
//  Created by Javier Rodríguez Gómez on 24/1/22.
//
//

import Foundation
import CoreData


extension UserInCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInCD> {
        return NSFetchRequest<UserInCD>(entityName: "UserInCD")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date
    @NSManaged public var friend: NSSet?
    
    public var wrappedID: String {
        id ?? "No id"
    }
    public var wrappedName: String {
        name ?? "No name"
    }
    public var wrappedCompany: String {
        company ?? "No company"
    }
    public var wrappedEmail: String {
        email ?? "No email"
    }
    public var wrappedAddress: String {
        address ?? "No address"
    }
    public var wrappedAbout: String {
        about ?? "No info about the user"
    }
    
    public var friendArray: [FriendInCD] {
        let set = friend as? Set<FriendInCD> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friend
extension UserInCD {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: FriendInCD)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: FriendInCD)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension UserInCD : Identifiable {

}
