//
//  DateUtils.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

enum DateFormatterString {
    case dateLetters
    case dateNumbers
    case hours
}

extension DateFormatterString : RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch (rawValue) {
        case "dd MMM, yyyy": self = .dateLetters
        case "dd-MM-yyyy": self = .dateNumbers
        case "HH:mm": self = .hours
            
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .dateLetters: return "dd MMM, yyyy"
        case .dateNumbers: return "dd-MM-yyyy"
        case .hours: return "HH:mm"
        }
    }
}

/// Transform time interval to String with a specific formatter
extension Date {
    func toDateString(format: DateFormatterString) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = .current
        return formatter.string(from: self)
    }
}

extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
