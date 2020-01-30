//
//  String+Extension.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = .current
        let date = dateFormatter.date(from: self)!
        print(date)
        return date
    }
}
