//
//  Hour.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import Foundation

struct Hour: Codable {
    let time: String
    let tempC: Double
    let isDay: Int
    let condition: Condition?
    let windKph: Double
    let pressureMB: Int
    let precipMm: Double
    let humidity: Int
    let feelslikeC: Double //
    let chanceOfRain: Int



    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case windKph = "wind_kph"
        case pressureMB = "pressure_mb"
        case precipMm = "precip_mm"
        case humidity
        case feelslikeC = "feelslike_c" // 1
        case chanceOfRain = "chance_of_rain" // 1
    }
}
