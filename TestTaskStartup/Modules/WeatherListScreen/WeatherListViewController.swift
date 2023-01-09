//
//  MainViewController.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 8.12.22.
//

import UIKit

final class WeatherListViewController: UIViewController {
    
    private var presenter: WeatherListPresenter!
    private let networkService = NetworkService()
    
    private var viewModel = [WeatherViewModel]()
    
    private let weatherTableView = UITableView()
    
    let searchBar: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.searchBarStyle = UISearchBar.Style.default
        searchController.searchBar.placeholder = "Enter the city name"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        presenter = WeatherListPresenter(viewController: self)
        presenter.loadCitiesModel()
        presenter.configureCitiesModel()
        configureTableView()
    }
    
//     MARK: – Internal func's  
    func configureViewModel(viewModels: [WeatherViewModel]) {
        viewModel = viewModels
        presenter.dispatchGroup.notify(queue: .main) {
            self.weatherTableView.reloadData()
        }
    }
    
    // MARK: - Private func's 
    
    private func configureSearchBar() {
        navigationItem.title = "Weather"
        navigationItem.searchController = searchBar
    }
    
    private func configureTableView() {
        view.addSubview(weatherTableView)
   
        weatherTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherTableView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            weatherTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        weatherTableView.rowHeight = CGFloat(60)
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        if #available(iOS 15.0, *) {
            weatherTableView.sectionHeaderTopPadding = 0
        }
        
        self.weatherTableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: WeatherListTableViewCell.reuseIdentifier)
    }
}

// MARK: - Extension

extension WeatherListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.reuseIdentifier, for: indexPath) as! WeatherListTableViewCell
        cityCell.configure(viewModel: viewModel[indexPath.row])
        return cityCell
    }

    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choosenCity = viewModel[indexPath.row].cityName
        print(choosenCity)
        presenter.pushViewController(viewController: self, cityName: choosenCity)
    }
    
}

// MARK: – UISearchBarDelegate

extension WeatherListViewController: UISearchControllerDelegate {
    
}
