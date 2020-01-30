//
//  Login+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Login {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Login> {
        return NSFetchRequest<Login>(entityName: "Login")
    }

    @NSManaged public var md5: String
    @NSManaged public var password: String
    @NSManaged public var salt: String
    @NSManaged public var sha1: String
    @NSManaged public var sha256: String
    @NSManaged public var username: String
    @NSManaged public var uuid: String
    @NSManaged public var loginOfUser: User?

}
