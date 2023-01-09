//
//  DetailPresenter.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 12.12.22.
//

import UIKit

protocol IDetailPresenter {
    
}

final class DetailPresenter {
    
    private var detailViewController: DetailViewController
    
    private var network = NetworkService()
    
    private var cityName: String
    
    private var detailViewModel = [DetailItemType]()
    
    let dispatchGroup = DispatchGroup()
    
    private let qeueue = DispatchQueue(label: "Weather")
    
    init(viewController: DetailViewController, cityName: String) {
        self.detailViewController = viewController
        self.cityName = cityName
    }
    
    func configureViewController(viewController: DetailViewController) {
        detailViewController = viewController
    }
    
    func configureDetailViewModel() {
        configureHeaderSectionModel()
        configureHourlySectionModel()
        configureDailySectionModel()
        configureConditionsSectionModel()
        dispatchGroup.notify(queue: .main) {
            self.detailViewController.configureViewModel(viewModel: self.detailViewModel)
        }
    }
    
    private func configureHeaderSectionModel() {
        dispatchGroup.enter()
                self.network.getWeather(location: self.cityName, numberOfDays: "7", completion: { [weak self] weather in
                    var headerArray = [HeaderModel]()
                    var minTemp: String?
                    var maxTemp: String?
                    for day in weather.forecast.forecastday {
                        minTemp = String(day.day.mintempC)
                        maxTemp = String(day.day.maxtempC)
                    }
                    guard let minTemp = minTemp,
                          let maxTemp = maxTemp else { return }
                    let headerModel = HeaderModel(cityName: self!.cityName,
                                                  currentTemp: String(weather.current.tempC),
                                                  condition: weather.current.condition.text,
                                                  minTemp: minTemp,
                                                  maxTemp: maxTemp)
                    headerArray.append(headerModel)
                    self!.detailViewModel.append(.header(item: headerArray))
                    self?.dispatchGroup.leave()
                })
    }
    
    private func configureHourlySectionModel() {
        dispatchGroup.enter()
                self.network.getWeather(location: self.cityName, numberOfDays: "1", completion: { [weak self] weather in
                    var hourlyArray = [HourlyModel]()
                    let image = UIImage()
                    for day in weather.forecast.forecastday {
                        for hour in day.hour {
                            let time = self!.convertDateToTime(inputTime: hour.time)
                            let condition = hour.condition!.text
                            let tempC = hour.tempC
                            let viewModel = HourlyModel(time: time,
                                                        condition: image.chooseTheSmallWeather(condition: condition),
                                                        timeTemp: String(tempC))
                            hourlyArray.append(viewModel)
                        }
                    }
                    self!.detailViewModel.append(.hourly(item: hourlyArray))
                    self?.dispatchGroup.leave()
                })
    }

    func configureDailySectionModel() {
        dispatchGroup.enter()
                self.network.getWeather(location: self.cityName, numberOfDays: "3", completion: { [weak self] weather in
                    var dailyArray = [DailyModel]()
                    for day in weather.forecast.forecastday {
                        let image = UIImage()
                        let weekDay = self!.convertDateToWeekDay(inputDate: day.date)
                        let viewModel = DailyModel(nameOfweekDay: weekDay,
                                               condtion: image.chooseTheWeather(condition: day.day.condition.text),
                                               chanceOfRain: String(day.day.dailyChanceOfRain),
                                               minTemp: String(day.day.mintempC),
                                               maxTemp: String(day.day.maxtempC))
                        dailyArray.append(viewModel)
                    }
                    self!.detailViewModel.append(.daily(item: dailyArray))
                    self!.dispatchGroup.leave()
                })
    }
    
    func configureConditionsSectionModel() {
        dispatchGroup.enter()
                self.network.getWeather(location: self.cityName, numberOfDays: "1", completion: { [weak self] weather in
                    var conditionArray = [ConditionViewModel]()
                    for day in weather.forecast.forecastday {
                    let model = ConditionsDataModel(sunrise: day.astro.sunrise,
                                                sunset: day.astro.sunset,
                                                dailyChanceOfRain: String(day.day.dailyChanceOfRain),
                                                avgHumidity: String(day.day.avghumidity),
                                                maxWindMph: String(day.day.maxwindMph),
                                                avgTempC: String(day.day.avgtempC),
                                                visibility: String(day.day.avgvisKM),
                                                uv: String(day.day.uv))
                        let firstRowConditions = ConditionViewModel(leftNameOfItem: "SUNRISE",
                                                                    leftDataOfItem: model.sunrise,
                                                                    rightNameOfItem: "SUNSET",
                                                                    rightDataOfItem: model.avgTempC + "°")
                        let secondRowConditions = ConditionViewModel(leftNameOfItem: "CHANCE OF RAIN",
                                                                     leftDataOfItem: model.dailyChanceOfRain + "%",
                                                                     rightNameOfItem: "HUMIDITY",
                                                                     rightDataOfItem: model.avgHumidity + "%")
                        let thirdRowConditions = ConditionViewModel(leftNameOfItem: "WIND",
                                                                    leftDataOfItem: model.maxWindMph + "km/hr",
                                                                    rightNameOfItem: "FEELS LIKE",
                                                                    rightDataOfItem: model.avgTempC + "°")
                        let fourthRowConditions = ConditionViewModel(leftNameOfItem: "VISIBILITY",
                                                                     leftDataOfItem: model.visibility + "km",
                                                                     rightNameOfItem: "UV",
                                                                     rightDataOfItem: model.uv)
                        conditionArray.append(firstRowConditions)
                        conditionArray.append(secondRowConditions)
                        conditionArray.append(thirdRowConditions)
                        conditionArray.append(fourthRowConditions)
                    }
                    self!.detailViewModel.append(.conditions(item: conditionArray))
                    self!.dispatchGroup.leave()
                })
    }
    
    private func convertDateToTime(inputTime: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let data = dateFormatter.date(from: inputTime)!
        dateFormatter.dateFormat = "HH:mm"
        let time = dateFormatter.string(from: data)
        
        return time
    }   
    
    private func convertDateToWeekDay(inputDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let data = dateFormatter.date(from: inputDate)!
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let weekDay = dateFormatter.string(from: data)
        
        return weekDay
    }
}
