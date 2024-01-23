//
//  UITableViewCell + Extension.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 21/01/2024.
//

import UIKit

public protocol Reusable {
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
}
