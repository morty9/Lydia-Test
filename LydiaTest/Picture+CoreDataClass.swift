//
//  Picture+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Picture)
public class Picture: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case large = "large"
        case medium = "medium"
        case thumbnail = "thumbnail"
    }

    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Picture", in: managedObjectContext) else {
            fatalError("Failed to decode Picture")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.large = try container.decodeIfPresent(String.self, forKey: .large)!
        self.medium = try container.decodeIfPresent(String.self, forKey: .medium)!
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)!
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(large, forKey: .large)
        try container.encode(medium, forKey: .medium)
        try container.encode(thumbnail, forKey: .thumbnail)
    }
    
}
