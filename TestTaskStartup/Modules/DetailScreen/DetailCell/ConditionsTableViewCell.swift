//
//  ConditionsTableViewCell.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import UIKit

protocol IConditionsTableViewCell {
    // func configure()
}

final class ConditionsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ConditionsTableViewCell"
    
    let leftInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.text = "SUNRISE"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let leftDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.text = "07:05"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.backgroundColor = .systemBackground
        label.text = "SUNSET"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.text = "08:30"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupLeftInfoLabelConstraints()
        setupLeftDataLabelConstraints()
        setupRightInfoLabelConstraints()
        setupRightDataLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal functions
    
    func configure(viewModel: ConditionViewModel) {
        leftInfoLabel.text = viewModel.leftNameOfItem
        leftDataLabel.text = viewModel.leftDataOfItem
        rightInfoLabel.text = viewModel.rightNameOfItem
        rightDataLabel.text = viewModel.rightDataOfItem
    }
    
    // MARK: - Privates functions
    
    private func setupCell() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    private func setupLeftInfoLabelConstraints() {
        contentView.addSubview(leftInfoLabel)
        
        NSLayoutConstraint.activate([
            leftInfoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            leftInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupLeftDataLabelConstraints() {
        contentView.addSubview(leftDataLabel)

        NSLayoutConstraint.activate([
            leftDataLabel.topAnchor.constraint(equalTo: leftInfoLabel.bottomAnchor),
            leftDataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupRightInfoLabelConstraints() {
        contentView.addSubview(rightInfoLabel)

        NSLayoutConstraint.activate([
            rightInfoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            rightInfoLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10)
        ])
    }
    
    private func setupRightDataLabelConstraints() {
        contentView.addSubview(rightDataLabel)

        NSLayoutConstraint.activate([
            rightDataLabel.topAnchor.constraint(equalTo: rightInfoLabel.bottomAnchor),
            rightDataLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10)
        ])
    }
}
