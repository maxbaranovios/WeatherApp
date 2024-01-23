//
//  ViewController.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 21/01/2024.
//

import UIKit
import SnapKit

protocol WeatherViewControllerProtocol {
    func setupCells(with viewModel: [WeatherCellViewModel])
}

final public class WeatherViewController: UIViewController {

    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = false
        tableView.register(WeatherTableViewCell.self)
        return tableView
    }()

    // MARK: - Properties

    var presenter: WeatherScreenPresenter? 
    private var cells: [WeatherCellViewModel] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}

// MARK: – Helpers func

private extension WeatherViewController {
    func setupUI() {
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

// MARK: – UITableViewDelegate Implementation

extension WeatherViewController: UITableViewDelegate {
    
}

// MARK: – UITableViewDataSource Implementation

extension WeatherViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.uniqueIdentifier) as! WeatherTableViewCell
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //cells.count
        return 1000
    }
}

// MARK: WeatherViewControllerProtocol Implementation

extension WeatherViewController: WeatherViewControllerProtocol {
    func setupCells(with viewModel: [WeatherCellViewModel]) {
        cells = viewModel
        tableView.reloadData()
    }
}
