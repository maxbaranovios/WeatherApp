//
//  DetailModel.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import Foundation

enum DetailItemType {
    case header(item: [HeaderModel])
    case daily(item: [DailyModel])
    case hourly(item: [HourlyModel])
    case conditions(item: [ConditionViewModel])
}


