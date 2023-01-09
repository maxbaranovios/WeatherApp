//
//  ConditionsModel.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 27.12.22.
//

import Foundation

struct ConditionsDataModel {
    let sunrise: String
    let sunset: String
    let dailyChanceOfRain: String
    let avgHumidity: String
    let maxWindMph: String
    let avgTempC: String
    let visibility: String
    let uv: String
}

struct ConditionViewModel {
    let leftNameOfItem: String
    let leftDataOfItem: String
    let rightNameOfItem: String
    let rightDataOfItem: String
}

