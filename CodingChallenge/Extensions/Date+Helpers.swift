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
        dateFormater.timeZone = .current
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.string(from: self)
    }

    func oneWeekAfter() -> String? {
        let calendar = Calendar.current
        print("$$$$$ ", calendar.date(byAdding: .weekOfMonth, value: 1, to: self)?.shiftDateFormat())
        return calendar.date(byAdding: .weekOfMonth, value: 1, to: self)?.shiftDateFormat()
    }
}
