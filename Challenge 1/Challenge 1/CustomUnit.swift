//
//  CustomUnit.swift
//  Challenge 1
//
//  Created by Felix Lin on 10/12/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import Foundation

struct CustomUnit {
    let text: String
    let unit: Dimension
}

struct Temperature {
    static let farenheit = CustomUnit(text: "°F", unit: UnitTemperature.fahrenheit)
    static let celsius = CustomUnit(text: "°C", unit: UnitTemperature.celsius)
    static let kelvin = CustomUnit(text: "K", unit: UnitTemperature.kelvin)
    static let units = [farenheit, celsius, kelvin]
}
