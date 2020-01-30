//
//  Location+CoreDataClass.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Location)
public class Location: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city = "city"
        case state = "state"
        case country = "country"
        case postcode = "postcode"
        case coordinates = "coordinates"
        case timezone = "timezone"
    }
    
    // MARK: Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Location", in: managedObjectContext) else {
            fatalError("Failed to decode Location")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)!
        
        do {
            self.postcode = try container.decodeIfPresent(String.self, forKey: .postcode)!
        } catch {}
        
        do {
            if let postcodeInt = try container.decodeIfPresent(Int32.self, forKey: .postcode) {
                self.postcode = String(postcodeInt)
            }
        } catch {}
        
        self.country = try container.decodeIfPresent(String.self, forKey: .country)!
        self.city = try container.decodeIfPresent(String.self, forKey: .country)!
        self.street = try container.decodeIfPresent(Street.self, forKey: .street)!
        self.coordinates = try container.decodeIfPresent(Coordinates.self, forKey: .coordinates)!
        self.timezone = try container.decodeIfPresent(Timezone.self, forKey: .timezone)!
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(state, forKey: .state)
        try container.encode(postcode, forKey: .postcode)
        try container.encode(country, forKey: .country)
        try container.encode(city, forKey: .city)
        try container.encode(street, forKey: .street)
        try container.encode(coordinates, forKey: .coordinates)
        try container.encode(timezone, forKey: .timezone)
    }

}
