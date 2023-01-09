//
//  MainPresenter.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 10.12.22.
//

import UIKit

final class WeatherListPresenter {
         
    private let weatherListViewController: WeatherListViewController // send array of MainViewModel
    
    private let network = NetworkService()
    
    private var cityModel: Cities? // [String]
    
    private var mainViewModel = [WeatherViewModel]()
    
    let dispatchGroup = DispatchGroup()
    
    init(viewController: WeatherListViewController) {
        self.weatherListViewController = viewController
    }
    
    func pushViewController(viewController: UIViewController, cityName: String) {
        let detailViewController = DetailViewController()
        let presenter = DetailPresenter(viewController: detailViewController, cityName: cityName)
        detailViewController.presenter = presenter
        viewController.navigationController?.pushViewController(detailViewController, animated: false)
    }
    
    func loadCitiesModel() {
        let arrayOfCities = ["London", "Warsaw", "Paris", "Berlin", "Minsk", "Singapore"]
        let citiesModel = Cities(namesOfCities: arrayOfCities)
        cityModel = citiesModel
    }
    
    func configureCitiesModel() {
        guard let model = cityModel else { return }
        for city in model.namesOfCities {
//            DispatchQueue.main.async {
            dispatchGroup.enter()
                self.network.getWeather(location: city, numberOfDays: "1", completion: { [weak self] weather in
                    let image = UIImage()
                    let outputTime = self!.convertDateToTime(inputTime: weather.location.localtime)
                    let viewModel = WeatherViewModel(cityName: weather.location.name,
                                                  currentTime: outputTime,
                                                  condition: image.chooseTheWeather(condition: weather.current.condition.text),
                                                  tempC: String(weather.current.tempC))
                    
                    self?.mainViewModel.append(viewModel)
                    self!.dispatchGroup.leave()
                    self?.weatherListViewController.configureViewModel(viewModels: self!.mainViewModel)
                })
//            }
        }
    }
    
    private func convertDateToTime(inputTime: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let data = formatter.date(from: inputTime)!
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: data)
        
        return time
    }

}
