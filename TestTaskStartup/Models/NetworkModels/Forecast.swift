//
//  Forecast.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import Foundation

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable {
    let date: String
    let day: Day
    let astro: Astro
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case day // rain, precipMM, avgVis, uv, maxWindKph  5
        case astro // sun 2
        case hour // humbity, feelsC, pressure 3
    }
}
