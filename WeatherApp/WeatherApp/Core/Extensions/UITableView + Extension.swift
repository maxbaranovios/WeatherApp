//
//  UITableViewCell + Extension.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 21/01/2024.
//

import UIKit

public protocol Reusable { // without public 
    static var uniqueIdentifier: String { get }
}

public extension Reusable {
    static var uniqueIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

public extension UITableView {
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.uniqueIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.uniqueIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell with identifier: \(T.uniqueIdentifier)")
        }
        return cell
    }
//
//    func dequeueReusableCell(with viewModel: AnyCellViewModel, for indexPath: IndexPath) -> UITableViewCell {
//        let identifier = type(of: viewModel).uniqueIdentifier
//        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        cell.accessibilityIdentifier = viewModel.accessibilityIdentifier(for: indexPath)
//        viewModel.setup(cell: cell)
//        return cell
//    }
}
//    func dequeueReusableCell(with viewModel: AnyCellViewModel, for indexPath: IndexPath) -> UITableViewCell {
//        let identifier = type(of: viewModel).uniqueIdentifier
//        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        cell.accessibilityIdentifier = viewModel.accessibilityIdentifier(for: indexPath)
//        viewModel.setup(cell: cell)
//        return cell
//    }
//
//    func register(_ modelType: AnyCellViewModel.Type) {
//        register(modelType.cellClass, forCellReuseIdentifier: modelType.uniqueIdentifier)
//    }
//}
//
//public protocol AnyCellViewModel: Reusable {
//    static var cellClass: AnyClass { get }
//    func setup(cell: AnyViewCell)
//    func size(constrainedBy maxWidth: CGFloat) -> CGSize?
//    func height(constrainedBy maxWidth: CGFloat) -> CGFloat?
//}
//
//public protocol Reusable {
//    static var uniqueIdentifier: String { get }
//}
//
//public extension Reusable {
//    static var uniqueIdentifier: String {
//        return String(describing: self)
//    }
//}
