//
//  HourlyElementCollectionViewCell.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import UIKit

protocol IHourlyElementCollectionViewCell {
    // configure()
}

final class HourlyElementCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "HourlyElementIdentifier"
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.text = "now°"
        label.backgroundColor = .systemBackground
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
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.text = "9°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTimeLabelConstraints()
        setupWeatherImageConstraints()
        setupTemperatureLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal function's
    
    func configureItem(viewModel: HourlyModel) {
        timeLabel.text = viewModel.time
        weatherImage.image = viewModel.condition
        temperatureLabel.text = viewModel.timeTemp + "°"
    }
    
    // MARK: - Private function's
    
    private func setupTimeLabelConstraints() {
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupWeatherImageConstraints() {
        contentView.addSubview(weatherImage)
        
        NSLayoutConstraint.activate([
            weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupTemperatureLabelConstraints() {
        contentView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
        ])
    }
}
