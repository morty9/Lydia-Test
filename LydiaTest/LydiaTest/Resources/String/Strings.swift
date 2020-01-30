//
//  Strings.swift
//  Lydia
//
//  Created by Bérangère La Touche on 24/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation

enum Strings: String {
    case nav_bar_title_list_controller = "controllers.list_controller.nav_bar_title_list_controller"
    case nav_bar_title_details_controller = "controllers.list_controller.nav_bar_title_details_controller"
    
    var localized: String {
        return self.rawValue.localized()
    }
}
