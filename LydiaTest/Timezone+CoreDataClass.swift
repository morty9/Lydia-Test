//
//  Timezone+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Timezone)
public class Timezone: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case desc = "description"
    }

    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Timezone", in: managedObjectContext) else {
            fatalError("Failed to decode Timezone")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.offset = try container.decodeIfPresent(String.self, forKey: .offset)!
        self.desc = try container.decodeIfPresent(String.self, forKey: .desc)!
    }

    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(offset, forKey: .offset)
        try container.encode(desc, forKey: .desc)
    }

}
