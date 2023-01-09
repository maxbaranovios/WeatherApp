//
//  Day.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import Foundation

struct Day: Codable {
    let maxtempC: Double
    let mintempC: Double
    let avgtempC: Double
    let maxwindMph: Double
    let totalprecipMm: Double // осадки precipitation 
    let avgvisKM: Double // visibility
    let avghumidity: Int // влажность
    let dailyChanceOfRain: Int // 
    let condition: Condition
    let uv: Int

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case avgtempC = "avgtemp_c"
        case maxwindMph = "maxwind_mph"
        case totalprecipMm = "totalprecip_mm"
        case avgvisKM = "avgvis_km"
        case avghumidity
        case dailyChanceOfRain = "daily_chance_of_rain"
        case condition
        case uv
    }
}
