//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 22/01/2024.
//

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
