//
//  Registered+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Registered {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Registered> {
        return NSFetchRequest<Registered>(entityName: "Registered")
    }

    @NSManaged public var age: Int32
    @NSManaged public var date: Date
    @NSManaged public var registeredOfUser: User?

}
