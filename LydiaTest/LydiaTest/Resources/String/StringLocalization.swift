//
//  StringLocalization.swift
//  Lydia
//
//  Created by Bérangère La Touche on 24/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
