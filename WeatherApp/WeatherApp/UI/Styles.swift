//
//  Styles.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 23/01/2024.
//

import Foundation

public enum Style {
    enum Size {
        /// 12
        static var sSize: CGFloat { 12 }
        /// 16
        static var mSize: CGFloat { 16 }
        /// 64
        static var xxSize: CGFloat { 64 }
    }
    
    enum Offsets {
        /// 8
        static var sOffset: CGFloat { 8 }
        /// 10
        static var mOffset: CGFloat { 10 }
        /// 12
        static var xOffset: CGFloat { 12 }
    }
    
    enum Space {
        ///  8
        static var sSpace: CGFloat { 8 }
    }
}
