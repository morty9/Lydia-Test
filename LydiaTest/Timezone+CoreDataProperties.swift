//
//  Timezone+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Timezone {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Timezone> {
        return NSFetchRequest<Timezone>(entityName: "Timezone")
    }

    @NSManaged public var desc: String
    @NSManaged public var offset: String
    @NSManaged public var timezoneOfLocation: Location?

}
