//
//  WeatherBuilder.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 22/01/2024.
//

import Foundation

public enum WeatherBuilder {
    public static func build(diContainer: WeatherDIContainer) -> WeatherViewController {
        let entity = WeatherInput(diContainer: diContainer)
        let viewController = WeatherViewController()
        let presenter = WeatherScreenPresenter(entity: entity)
        presenter.view = viewController
        viewController.presenter = presenter
        return viewController
    }
}
