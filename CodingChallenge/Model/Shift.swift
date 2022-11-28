//
//  Shift.swift
//  CodingChallenge
//
//  Created by Karrar Abd Ali on 28/11/2022.
//

import Foundation

struct Shift: Codable {
    let shiftID: Int
    let startTime, endTime: Date
    let normalizedStartDateTime, normalizedEndDateTime: String
    let premiumRate, covid: Bool
    let withinDistance: Int

    enum CodingKeys: String, CodingKey {
        case shiftID = "shift_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case normalizedStartDateTime = "normalized_start_date_time"
        case normalizedEndDateTime = "normalized_end_date_time"
        case premiumRate = "premium_rate"
        case covid
        case withinDistance = "within_distance"
    }
}
