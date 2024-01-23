//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 21/01/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let weatherDIContainer = WeatherDIContainer(weatherService: WeatherNetworkService.build())
        let viewController = WeatherBuilder.build(diContainer: weatherDIContainer)
        let navigationController = UINavigationController(rootViewController: viewController)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
