//
//  Dob+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Dob {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dob> {
        return NSFetchRequest<Dob>(entityName: "Dob")
    }

    @NSManaged public var age: Int32
    @NSManaged public var date: Date
    @NSManaged public var dobOfUser: User?

}
