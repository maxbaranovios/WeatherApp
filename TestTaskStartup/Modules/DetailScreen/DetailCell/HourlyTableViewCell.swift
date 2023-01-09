//
//  HourlyTableViewCell.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 26.12.22.
//

import UIKit

protocol IHourlyTableViewCell {
    // configure()
}

final class HourlyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "HourlyCell"
    
    private var hourlyCollectionView: UICollectionView!
    
    private var hourlyElementViewModel = [HourlyModel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupCollectionView()
        setupCollectionViewConstraintrs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal functuin's
    
    func configure(viewModel: [HourlyModel]) {
        hourlyElementViewModel = viewModel
        hourlyCollectionView.reloadData()       
    }
    
    // MARK: - Private function's
    
    private func setupCell() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    private func setupCollectionView() {
        let layout = setupFlowLayout()

        hourlyCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        hourlyCollectionView.showsHorizontalScrollIndicator = false
        
        hourlyCollectionView.dataSource = self
        hourlyCollectionView.delegate = self
        
        hourlyCollectionView.register(HourlyElementCollectionViewCell.self, forCellWithReuseIdentifier: HourlyElementCollectionViewCell.reuseIdentifier)
    }
    
    private func setupCollectionViewConstraintrs() {
        hourlyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(hourlyCollectionView)
        NSLayoutConstraint.activate([
            hourlyCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hourlyCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hourlyCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hourlyCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupFlowLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 5.0
        return layout
    }
}

// MARK: - Extensions
extension HourlyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyElementViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = hourlyElementViewModel[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyElementCollectionViewCell.reuseIdentifier, for: indexPath) as! HourlyElementCollectionViewCell
        cell.configureItem(viewModel: model)
        return cell
    }
    
}
