//
//  Location+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var city: String
    @NSManaged public var country: String
    @NSManaged public var postcode: String
    @NSManaged public var state: String
    @NSManaged public var coordinates: Coordinates
    @NSManaged public var locationOfUser: User?
    @NSManaged public var street: Street
    @NSManaged public var timezone: Timezone

}
