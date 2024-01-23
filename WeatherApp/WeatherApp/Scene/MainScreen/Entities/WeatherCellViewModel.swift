//
//  WeatherCellViewModel.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 23/01/2024.
//

import UIKit

struct WeatherInput {
    let weatherService: WeatherNetworkServiceProtocol
    
    public init(diContainer: WeatherDIContainer) {
        self.weatherService = diContainer.weatherService
    }
}

public struct WeatherDIContainer {
    public let weatherService: WeatherNetworkServiceProtocol
    
    public init(weatherService: WeatherNetworkServiceProtocol) {
        self.weatherService = weatherService
    }
}

struct WeatherScreenViewModel {
    let weatherCellViewModels: [WeatherCellViewModel]
}

struct WeatherCellViewModel {
    let image: UIImage?
    let eventName: String
    let startDate: String
    let endDate: String
    let senderName: String
}
