//
//  Date+Helpers.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

import Foundation

extension Date {
    func shiftDateFormat() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.string(from: self)
    }

    func oneWeekAfter() -> Date? {
        let calendar = Calendar.current
        return calendar.date(byAdding: .weekOfMonth, value: 1, to: self)
    }
}
