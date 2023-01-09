//
//  DetailViewController.swift
//  TestTaskStartup
//
//  Created by Maxim Baranov on 11.12.22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailTableView = UITableView()
    var presenter: DetailPresenter!
    
    var detailViewModel = [DetailItemType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configureViewController(viewController: self)
        presenter.configureDetailViewModel()
        setupDetailTableView()
        setupDetailTableViewContraints()
    }

    // MARK: - Internal functions
    
    func configureViewModel(viewModel: [DetailItemType]) {
        detailViewModel = viewModel
        self.detailTableView.reloadData()
    }

    // MARK: - Privates functions
    private func setupDetailTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        self.detailTableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.reuseIdentifier)
        self.detailTableView.register(HourlyTableViewCell.self, forCellReuseIdentifier: HourlyTableViewCell.reuseIdentifier)
        self.detailTableView.register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.reuseIdentifier)
        self.detailTableView.register(ConditionsTableViewCell.self, forCellReuseIdentifier: ConditionsTableViewCell.reuseIdentifier)
    }
    
    private func setupDetailTableViewContraints() {
        view.addSubview(detailTableView)
        view.backgroundColor = .systemBackground
        detailTableView.frame = view.bounds
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(detailViewModel.count)
        return detailViewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch detailViewModel[section] {
        case .header(item: let header):
            return header.count
        case .daily(item: let days):
            return days.count
        case .hourly(item: _):
            return 1
        case .conditions(item: let condition):
            return condition.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch detailViewModel[indexPath.section] {
        case .header(item: let item):
            let header = item[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.reuseIdentifier, for: indexPath) as! HeaderTableViewCell
            cell.configure(viewModel: header)
            return cell
        case .daily(item: let item):
            let day = item[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.reuseIdentifier, for: indexPath) as! DailyTableViewCell
            cell.configure(viewModel: day)
            return cell
        case .hourly(item: let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.reuseIdentifier, for: indexPath) as! HourlyTableViewCell
            cell.configure(viewModel: item)
            return cell 
        case .conditions(item: let item):
            let conditionItem = item[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: ConditionsTableViewCell.reuseIdentifier, for: indexPath) as! ConditionsTableViewCell
            cell.configure(viewModel: conditionItem)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch detailViewModel[indexPath.section] {
        case .header(item: _):
            return 200
        case .daily(item: _):
            return 60
        case .hourly(item: _):
            return 60
        case .conditions(item: _):
            return 60
        }
    }
}


