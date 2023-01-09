//
//  WeatherNetworkService.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 10.12.22.
//

import Alamofire
import Foundation

final class NetworkService {
    
    public func getWeather(location: String, numberOfDays: String, completion: @escaping (Weather) -> Void) {
        let url = "http://api.weatherapi.com/v1/forecast.json?key=f2e2f899ae7f4beba66164913221712&q=\(location)&days=\(numberOfDays)&aqi=no&alerts=no"
        let request = AF.request(url)
        request.responseDecodable(of: Weather.self) { (dataResponce) in
            switch dataResponce.result {
            case .success(_):
                guard let data = dataResponce.value else { return }
                let dataOfWeather = Weather(location: data.location, current: data.current, forecast: data.forecast)
                completion(dataOfWeather)
            case .failure(_):
                guard let error = dataResponce.error else { return }
                print("Error is", error)
            }
        }
    }
}


