//
//  User+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case gender = "gender"
        case name = "name"
        case location = "location"
        case email = "email"
        case login = "login"
        case dob = "dob"
        case registered = "registered"
        case phone = "phone"
        case cell = "cell"
        case id = "id"
        case picture = "picture"
        case nat = "nat"
    }
    
    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)!
        self.email = try container.decodeIfPresent(String.self, forKey: .email)!
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)!
        self.cell = try container.decodeIfPresent(String.self, forKey: .cell)!
        self.nat = try container.decodeIfPresent(String.self, forKey: .nat)!
        self.name = try container.decodeIfPresent(Name.self, forKey: .name)!
        self.location = try container.decodeIfPresent(Location.self, forKey: .location)!
        self.login = try container.decodeIfPresent(Login.self, forKey: .login)!
        self.dob = try container.decodeIfPresent(Dob.self, forKey: .dob)!
        self.registered = try container.decodeIfPresent(Registered.self, forKey: .registered)!
        self.id = try container.decodeIfPresent(Id.self, forKey: .id)!
        self.picture = try container.decodeIfPresent(Picture.self, forKey: .picture)!
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gender, forKey: .gender)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
        try container.encode(cell, forKey: .cell)
        try container.encode(nat, forKey: .nat)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(login, forKey: .login)
        try container.encode(dob, forKey: .dob)
        try container.encode(registered, forKey: .registered)
        try container.encode(id, forKey: .id)
        try container.encode(picture, forKey: .picture)
    }
    
}
