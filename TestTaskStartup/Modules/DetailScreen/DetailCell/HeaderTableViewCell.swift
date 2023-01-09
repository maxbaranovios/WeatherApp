//
//  HeaderDetailTableViewCell.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 25.12.22.
//

import UIKit

protocol IHeaderTableViewCell {
//    func configure(viewModel: DetailViewModel)
}

final class HeaderTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "HeaderIdentifier"
    
    //MARK: - UIElements
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    let additionalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .black
        label.text = "New York"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 90)
        label.textColor = .black
        label.text = "20°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Mostly Cloudy"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "H:8°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "L:0°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Override
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell() 
        setupStackViewConstraints()
        setupStackViewElements()
        setupAdditionalStackViewElements()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal function's
    func configure(viewModel: HeaderModel) {
        cityLabel.text = viewModel.cityName
        temperatureLabel.text = viewModel.currentTemp + "°"
        weatherLabel.text = viewModel.condition
        minTemperatureLabel.text = "H:" + viewModel.minTemp + "°"
        maxTemperatureLabel.text = "L:" + viewModel.maxTemp + "°"
    }
    
    // MARK: - Private function's
    
    private func setupCell() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    private func setupStackViewConstraints() {
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func setupStackViewElements() {
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(weatherLabel)
        stackView.addArrangedSubview(additionalStackView)
    }
    
    private func setupAdditionalStackViewElements() {
        additionalStackView.addArrangedSubview(minTemperatureLabel)
        additionalStackView.addArrangedSubview(maxTemperatureLabel)
    }

}
