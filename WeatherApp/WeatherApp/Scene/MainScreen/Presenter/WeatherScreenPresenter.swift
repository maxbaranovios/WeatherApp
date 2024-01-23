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
    
    weak var view: WeatherViewController?
    private let entity: WeatherInput

    private let dateFormatter = DateFormatter()
    
    
    init(entity: WeatherInput) {
        self.entity = entity
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    // MARK: - Helpers func
    
    private func fetchData() {
        let url = URL(string: "https://api.weather.gov/alerts/active?status=actual&message_type=alert")!
        entity.weatherService.fetchData(url: url) { [weak self] (result: Result<WeatherInfo, Error>) in
            switch result {
            case .success(let data):
                self?.handleResponse(data.features)
            case .failure(let error):
                print("Error downloading data:", error)
            }
        }
    }
    
    private func handleResponse(_ response: [Feature]) {
        var viewModel: [WeatherCellViewModel] = []
        
        response.forEach { feature in
            let url = URL(string: "https://picsum.photos/1000")
            entity.weatherService.fetchImage(url: url!) { [weak self] image in
                viewModel.append(WeatherCellViewModel(image: image,
                                                      eventName: feature.properties.event,
                                                      startDate: self?.formatDate(date: feature.properties.effective) ?? "Error",
                                                      endDate: self?.formatDate(date: feature.properties.ends) ?? "Error",
                                                      senderName: feature.properties.senderName)
                )
            }
        }
        DispatchQueue.main.async {
            self.view?.setupCells(with: viewModel)
        }
    }
    
    private func formatDate(date: Date?) -> String {
        guard let validDate = date else {
            return ""
        }
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: validDate)
        print(dateString)
        return dateString
    }
}
