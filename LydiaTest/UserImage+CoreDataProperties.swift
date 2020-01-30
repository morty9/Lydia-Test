//
//  UserImage+CoreDataProperties.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData


extension UserImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserImage> {
        return NSFetchRequest<UserImage>(entityName: "UserImage")
    }

    @NSManaged public var image: Data?
    @NSManaged public var user_uuid: String?

}
