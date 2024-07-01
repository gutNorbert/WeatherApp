//
//  CurrentWeatherResponse.swift
//  DomainLayer
//
//  Created by Valentin Taradaj on 28/06/2024.
//

import Foundation

public struct CurrentWeatherResponse {
    public let temp: Double
    public let main: String
    
    public init(temp: Double, main: String) {
        self.temp = temp
        self.main = main
    }
}

public struct Main {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
}

public struct Weather {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
