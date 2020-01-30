//
//  UserResult.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class UserResult: Codable {
    
    public let results: [User]?
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([User].self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
}
