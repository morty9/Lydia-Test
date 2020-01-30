//
//  User+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var cell: String
    @NSManaged public var email: String
    @NSManaged public var gender: String
    @NSManaged public var nat: String
    @NSManaged public var phone: String
    @NSManaged public var dob: Dob
    @NSManaged public var id: Id
    @NSManaged public var location: Location
    @NSManaged public var login: Login
    @NSManaged public var name: Name
    @NSManaged public var picture: Picture
    @NSManaged public var registered: Registered

}
