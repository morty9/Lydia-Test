//
//  UserViewModel.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

class UserViewModel {
    
    private var user: User
    
    public var completeName: String {
        return "\(user.name.first.capitalized) \(user.name.last.capitalized)"
    }
    
    public var title: String {
        return user.name.title
    }
    
    public var last: String {
        return user.name.last
    }
    
    public var first: String {
        return user.name.first
    }
    
    public var email: String {
        return user.email
    }
    
    func picture(_ format: PictureFormat) -> String {
        switch format {
        case .large:
            return user.picture.large
        case .medium:
            return user.picture.medium
        case .thumbnail:
            return user.picture.thumbnail
        }
    }
    
    public var medium: String {
        return user.picture.medium
    }
    
    public var large: String {
        return user.picture.large
    }
    
    public var gender: String {
        return user.gender
    }
    
    public var genderImage: UIImage {
        switch user.gender {
        case "female":
            return #imageLiteral(resourceName: "female")
        case "male":
            return #imageLiteral(resourceName: "male")
        default:
            return UIImage()
        }
    }
    
    public var city: String {
        return user.location.city
    }
    
    public var birthday: String {
        return "\(user.dob.date.toDateString(format: .dateLetters))"
    }

    var phone: String {
        return user.phone
    }
    
    var cell: String {
        return user.cell
    }
    
    var username: String {
        return user.login.username
    }
    
    var password: String {
        return user.login.password
    }
    
    var coordinates: Coordinates {
        return user.location.coordinates
    }
    
    var uuid: String {
        return user.login.uuid
    }
    
    var address: String {
        return "\(user.location.street.number) \(user.location.street.name), \(user.location.city)"
    }
    
    init(user: User) {
        self.user = user
    }

    
}
