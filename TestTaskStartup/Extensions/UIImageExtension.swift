//
//  UIImageExtension.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 8.01.23.
//

import UIKit

extension UIImage {
    
    enum WeatherCondition: String {
        case rain = "Cloudly"
        case lightRain = "Light rain"
        case patchRain = "Patch rain"
        case patchRainPos = "Patchy rain possible"
        case overcast = "Overcast"
        case lightDrizzle = "Light drizzle"
        case rainWithThunder = "Moderate or heavy rain with thunder"
        case sunny = "Sunny"
        case clear = "Clear"
        case partlyCloudly = "Partly cloud"
        case cloudy = "Cloudy"
    }
    
    func chooseTheWeather(condition: String) -> UIImage {
        let condition = WeatherCondition(rawValue: condition)
        switch condition {
        case .rain:
            return UIImage(named: "rainImage")!
        case .sunny:
            return UIImage(named: "sunnyImage")!
        case .lightRain:
            return UIImage(named: "rainImage")!
        case .patchRain:
            return UIImage(named: "rainImage")!
        case .patchRainPos:
            return UIImage(named: "rainImage")!
        case .overcast:
            return UIImage(named: "cloudlyImage")!
        case .lightDrizzle:
            return UIImage(named: "stormImage")!
        case .rainWithThunder:
            return UIImage(named: "stormImage")!
        case .clear:
            return UIImage(named: "sunnyImage")!
        case .partlyCloudly:
            return UIImage(named: "partCloulyImage")!
        case .cloudy:
            return UIImage(named: "cloudlyImage")!
        case .none:
            return UIImage(named: "sunnyImage")!
        }
    }
    
    func chooseTheSmallWeather(condition: String) -> UIImage {
        let condition = WeatherCondition(rawValue: condition)
        switch condition {
        case .rain:
            return UIImage(named: "smallRainImage")!
        case .sunny:
            return UIImage(named: "smallSunnyImage")!
        case .lightRain:
            return UIImage(named: "smallRainImage")!
        case .patchRain:
            return UIImage(named: "smallRainImage")!
        case .patchRainPos:
            return UIImage(named: "smallRainImage")!
        case .overcast:
            return UIImage(named: "smallCloudlyImage")!
        case .lightDrizzle:
            return UIImage(named: "smallStormImage")!
        case .rainWithThunder:
            return UIImage(named: "smallStormImage")!
        case .clear:
            return UIImage(named: "smallSunnyImage")!
        case .partlyCloudly:
            return UIImage(named: "smallPartCloulyImage")!
        case .cloudy:
            return UIImage(named: "smallCloudlyImage")!
        case .none:
            return UIImage(named: "smallSunnyImage")!
        }
    }
}
