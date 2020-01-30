//
//  ErrorMessage.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

struct ErrorMessage {
    func showError(msg: String) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}
