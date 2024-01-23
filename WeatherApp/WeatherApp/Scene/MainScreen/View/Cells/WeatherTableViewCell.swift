//
//  WeatherrTableViewCell.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 21/01/2024.
//

import UIKit

protocol WeatherTableViewCellProtocol {
    func setup(with viewModel: WeatherCellViewModel)
}

final class WeatherTableViewCell: UITableViewCell {
    
    // MARK: – Views
    
    private let eventNameLabel = UILabel()
    private let startDateLabel = UILabel()
    private let endDateLabel = UILabel()
    private let senderName = UILabel()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    private lazy var datesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startDateLabel, endDateLabel])
        stackView.spacing = Style.Space.sSpace
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Initialization
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Setup
    
    private func setupUI() {
        backgroundColor = .clear
        
        [
            weatherImageView,
            eventNameLabel,
            datesStackView,
            senderName
        ].forEach { addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        weatherImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(Style.Offsets.mOffset)
            $0.verticalEdges.equalToSuperview().inset(Style.Offsets.sOffset)
            $0.size.equalTo(Style.Size.xxSize)
        }
        
        eventNameLabel.snp.makeConstraints {
            $0.leading.equalTo(weatherImageView.snp.trailing).offset(Style.Offsets.sOffset)
            $0.top.equalToSuperview().inset(Style.Offsets.mOffset)
            $0.height.equalTo(Style.Size.mSize)
        }
        
        startDateLabel.snp.makeConstraints {
            $0.height.equalTo(Style.Size.sSize)
        }
        
        endDateLabel.snp.makeConstraints {
            $0.height.equalTo(Style.Size.sSize)
        }
        
        datesStackView.snp.makeConstraints {
            $0.leading.equalTo(weatherImageView.snp.trailing).offset(Style.Offsets.sOffset)
            $0.bottom.equalToSuperview().inset(Style.Offsets.mOffset)
        }
        
        senderName.snp.makeConstraints {
            $0.height.equalTo(Style.Size.sSize)
            $0.trailing.bottom.equalToSuperview().inset(Style.Offsets.mOffset)
        }
    }
}

// MARK: – WeatherTableViewCellProtocol Implementation

extension WeatherTableViewCell: WeatherTableViewCellProtocol {
    func setup(with viewModel: WeatherCellViewModel) {
        eventNameLabel.text = viewModel.eventName
        weatherImageView.image = viewModel.image
        startDateLabel.text = viewModel.startDate
        senderName.text = viewModel.senderName
        endDateLabel.text = viewModel.endDate
    }
}
