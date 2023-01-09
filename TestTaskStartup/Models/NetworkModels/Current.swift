//
//  Current.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import Foundation

struct Current: Codable {
    let tempC: Int
    let isDay: Int
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
    }
}
