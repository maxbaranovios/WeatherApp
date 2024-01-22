//
//  WeatherrTableViewCell.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 21/01/2024.
//

import UIKit

final class WeatherTableViewCell: UITableViewCell {
    
    // MARK: – Views
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    private let eventNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Event VO, cool!"
        return label
    }()
    
    private let startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "start: 20.10.1999"
        return label
    }()
    
    private let endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "end:  30.01.2000"
        return label
    }()
    
    private lazy var datesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startDateLabel, endDateLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()
    
    private let senderName: UILabel = {
        let label = UILabel()
        label.text = "sender: Maxim"
        return label
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
        backgroundColor = .orange
        
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
            $0.leading.equalToSuperview().inset(10)
            $0.verticalEdges.equalToSuperview().inset(8)
            $0.size.equalTo(64)
        }
        
        eventNameLabel.snp.makeConstraints {
            $0.leading.equalTo(weatherImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(10)
            $0.height.equalTo(16)
        }
        
        startDateLabel.snp.makeConstraints {
            $0.height.equalTo(12)
        }
        
        endDateLabel.snp.makeConstraints {
            $0.height.equalTo(12)
        }
        
        datesStackView.snp.makeConstraints {
            $0.leading.equalTo(weatherImageView.snp.trailing).offset(8)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        senderName.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.trailing.bottom.equalToSuperview().inset(10)
        }
    }
        
    public func setup() {

    }
}
