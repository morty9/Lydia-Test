//
//  Registered+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Registered)
public class Registered: NSManagedObject, Codable  {

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case age = "age"
    }
    
    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Registered", in: managedObjectContext) else {
            fatalError("Failed to decode Registered")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decodeIfPresent(Date.self, forKey: .date)!
        self.age = try container.decodeIfPresent(Int32.self, forKey: .age)!
    }

    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(age, forKey: .age)
    }
    
}
