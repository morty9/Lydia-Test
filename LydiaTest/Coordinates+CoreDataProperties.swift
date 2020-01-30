//
//  Coordinates+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Coordinates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coordinates> {
        return NSFetchRequest<Coordinates>(entityName: "Coordinates")
    }

    @NSManaged public var latitude: String
    @NSManaged public var longitude: String
    @NSManaged public var coordOfLocation: Location?

}
