//
//  UserImageViewModel.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

class UserImageViewModel {
    
    private var userImage: UserImage
    
    init(userImage: UserImage) {
        self.userImage = userImage
    }
    
    var image: UIImage {
        return UIImage(data: userImage.image!)!
    }
    
    var uuid: String {
        return userImage.user_uuid!
    }
}
