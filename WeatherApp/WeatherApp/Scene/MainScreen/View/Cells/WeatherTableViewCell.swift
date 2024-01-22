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
    
    // MARK: - Initialization
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        print("Working")
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Setup
    
    private func setupUI() {
        backgroundColor = .orange
        
//        [
//            weatherImageView
//        ].forEach {
//            addSubview($0)
//        }
    }
    
    private func setupConstraints() {
//        weatherImageView.snp.makeConstraints {
//            $0.leading.equalToSuperview().inset(10)
//            $0.verticalEdges.equalToSuperview()
//
//        }
    }
        
    public func setup() {

    }
}
