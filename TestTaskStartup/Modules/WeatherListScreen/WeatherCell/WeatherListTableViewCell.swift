//
//  MainTableViewCell.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 10.12.22.
//

import UIKit

final class WeatherListTableViewCell: UITableViewCell {
    
    // MARK: - Variables and Constants
    
    static let reuseIdentifier = "WeatherListTableViewCell"
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.text = "My Location"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .black
        label.text = "20°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunnyImage")
        return imageView
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupTimeLabelConstraints()
        setupCityLabelConstraints()
        setupTemperatureLabelConstraints()
        setupWeatherImageConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal functions
     
    func configure(viewModel: WeatherViewModel) {
        timeLabel.text = viewModel.currentTime
        cityLabel.text = viewModel.cityName
        weatherImage.image = viewModel.condition
        temperatureLabel.text = viewModel.tempC + "°"
    }
    
    // MARK: - Private functions
    
    private func setupCell() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    private func setupTimeLabelConstraints() {
        addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupCityLabelConstraints() {
        addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupTemperatureLabelConstraints() {
        addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: self.topAnchor),
            temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupWeatherImageConstraints() {
        addSubview(weatherImage)
        
        NSLayoutConstraint.activate([
            weatherImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            weatherImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 50)
        ])
    }
    
}
