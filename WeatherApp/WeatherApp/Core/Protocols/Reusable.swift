//
//  Reusable.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 23/01/2024.
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
