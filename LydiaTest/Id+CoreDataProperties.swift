//
//  Id+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Id {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Id> {
        return NSFetchRequest<Id>(entityName: "Id")
    }

    @NSManaged public var name: String
    @NSManaged public var value: String?
    @NSManaged public var idOfUser: User?

}
