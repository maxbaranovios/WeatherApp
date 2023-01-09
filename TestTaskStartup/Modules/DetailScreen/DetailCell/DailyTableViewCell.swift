//
//  DailyTableViewCell.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import UIKit

protocol IDailyTableViewCell {
    // func configure()
}

final class DailyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DailyTableViewCell"
    
    // MARK: – UI Elements
    
    let nameOfDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.text = "monday"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "smalSunnyImage")
        imageView.sizeToFit()
        return imageView
    }()
    
    let chanceOfRainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "40%"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "10°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "20°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupNameOfDayLabelConstraints()
        setupWeatherImageConstraints()
        setupChanceOfRainLabelConstraints()
        setupMaxTemperatureLabelLabelConstraints()
        setupMinTemperatureLabelLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal functions
    
    func configure(viewModel: DailyModel) {
        nameOfDayLabel.text = viewModel.nameOfweekDay
        weatherImage.image = viewModel.condtion
        chanceOfRainLabel.text = viewModel.chanceOfRain + "%"
        minTemperatureLabel.text = viewModel.minTemp + "°"
        maxTemperatureLabel.text = viewModel.maxTemp + "°"
    }
    
    // MARK: - Privates functions
    private func setupCell() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
        
    private func setupNameOfDayLabelConstraints() {
        addSubview(nameOfDayLabel)
        
        NSLayoutConstraint.activate([
            nameOfDayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameOfDayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameOfDayLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupWeatherImageConstraints() {
        addSubview(weatherImage)
        
        NSLayoutConstraint.activate([
            weatherImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            weatherImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func setupChanceOfRainLabelConstraints() {
        addSubview(chanceOfRainLabel)
        
        NSLayoutConstraint.activate([
            chanceOfRainLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 10),
            chanceOfRainLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func setupMinTemperatureLabelLabelConstraints() {
        addSubview(minTemperatureLabel)
        
        NSLayoutConstraint.activate([
            minTemperatureLabel.trailingAnchor.constraint(equalTo: maxTemperatureLabel.leadingAnchor, constant: -15),
            minTemperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func setupMaxTemperatureLabelLabelConstraints() {
        addSubview(maxTemperatureLabel)
        
        NSLayoutConstraint.activate([
            maxTemperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            maxTemperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

