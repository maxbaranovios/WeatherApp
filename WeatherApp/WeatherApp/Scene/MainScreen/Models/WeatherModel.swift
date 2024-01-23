//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 22/01/2024.
//

import Foundation

struct WeatherInfo: Decodable {
    let features: [Feature]
}

struct Feature: Decodable {
    let id: String
    let properties: Properties
}

struct Properties: Decodable {
    let effective: Date
    let ends: Date?
    let event: String
    let senderName: String
}
