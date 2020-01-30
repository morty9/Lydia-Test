//
//  Name+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Name)
public class Name: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case last = "last"
        case first = "first"
    }
    
    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Name", in: managedObjectContext) else {
            fatalError("Failed to decode Name")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)!
        self.last = try container.decodeIfPresent(String.self, forKey: .last)!
        self.first = try container.decodeIfPresent(String.self, forKey: .first)!
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(last, forKey: .last)
        try container.encode(first, forKey: .first)
    }

}
