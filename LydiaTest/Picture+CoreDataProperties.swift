//
//  Picture+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension Picture {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Picture> {
        return NSFetchRequest<Picture>(entityName: "Picture")
    }

    @NSManaged public var large: String
    @NSManaged public var medium: String
    @NSManaged public var thumbnail: String
    @NSManaged public var pictureOfUser: User?

}
