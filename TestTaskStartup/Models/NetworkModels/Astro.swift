//
//  Astro.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import Foundation

struct Astro: Codable {
    let sunrise: String
    let sunset: String

    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
    }
}
