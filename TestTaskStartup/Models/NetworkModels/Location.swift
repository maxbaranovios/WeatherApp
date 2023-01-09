//
//  Location.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import Foundation

struct Location: Codable {
    let name: String
    let country: String
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case localtime
    }
}
