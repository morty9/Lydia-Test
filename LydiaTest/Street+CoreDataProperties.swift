//
//  Street+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Street {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Street> {
        return NSFetchRequest<Street>(entityName: "Street")
    }

    @NSManaged public var name: String
    @NSManaged public var number: Int32
    @NSManaged public var streetOfLocation: Location?

}
