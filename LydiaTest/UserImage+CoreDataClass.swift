//
//  UserImage+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(UserImage)
public class UserImage: NSManagedObject {
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case user_uuid = "user_uuid"
    }
    
    convenience init(image: Data, user_uuid: String) {
        self.init()
        self.image = image
        self.user_uuid = user_uuid
    }
    
    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "UserImage", in: managedObjectContext) else {
            fatalError("Failed to decode Registered")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decodeIfPresent(Data.self, forKey: .image)!
        self.user_uuid = try container.decodeIfPresent(String.self, forKey: .user_uuid)!
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image, forKey: .image)
        try container.encode(user_uuid, forKey: .user_uuid)
    }

}
