//
//  Street+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Street)
public class Street: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case number = "number"
        case name = "name"
    }
    
    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Street", in: managedObjectContext) else {
            fatalError("Failed to decode Street")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decodeIfPresent(Int32.self, forKey: .number)!
        self.name = try container.decodeIfPresent(String.self, forKey: .name)!
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        try container.encode(name, forKey: .name)
    }
    
}
