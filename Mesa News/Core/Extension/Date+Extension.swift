//
//  Date+Extension.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 19/04/21.
//

import Foundation

extension Date {
    
    struct Formatter {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale.current
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            return formatter
        }()
    }
    
    var iso8601: String { return Formatter.iso8601.string(from: self) }
}
