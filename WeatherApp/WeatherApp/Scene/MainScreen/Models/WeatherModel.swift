//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 22/01/2024.
//

import Foundation

struct WeatherInfo: Codable {
    let features: [Feature]
}

struct Feature: Codable {
    let id: String
    let properties: Properties
}

struct Properties: Codable {
    let effective: Date
    let ends: Date?
    let event: String
    let senderName: String
}
