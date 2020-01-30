//
//  Login+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Login)
public class Login: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case username = "username"
        case password = "password"
        case salt = "salt"
        case md5 = "md5"
        case sha1 = "sha1"
        case sha256 = "sha256"
    }
    
    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Login", in: managedObjectContext) else {
            fatalError("Failed to decode Login")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decodeIfPresent(String.self, forKey: .uuid)!
        self.username = try container.decodeIfPresent(String.self, forKey: .username)!
        self.password = try container.decodeIfPresent(String.self, forKey: .password)!
        self.salt = try container.decodeIfPresent(String.self, forKey: .salt)!
        self.md5 = try container.decodeIfPresent(String.self, forKey: .md5)!
        self.sha1 = try container.decodeIfPresent(String.self, forKey: .sha1)!
        self.sha256 = try container.decodeIfPresent(String.self, forKey: .sha256)!
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(salt, forKey: .salt)
        try container.encode(md5, forKey: .md5)
        try container.encode(sha1, forKey: .sha1)
        try container.encode(sha256, forKey: .sha256)
    }

}
