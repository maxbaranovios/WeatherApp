//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 22/01/2024.
//
// https://api.weather.gov/alerts/active?status=actual&message_type=alert
// https://picsum.photos/1000

import UIKit

protocol WeatherScreenPresenterProtocol {
    func viewDidLoad()
}

final class WeatherScreenPresenter: WeatherScreenPresenterProtocol {
    
    var viewController = WeatherViewController()
    
    func viewDidLoad() {
        
    }
    
    private func fetch() {
        
    }
}
