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
    public let tempMin: Double
    public let tempMax: Double
    public let location: String
    
    public init(temp: Double,
                main: String,
                tempMin: Double,
                tempMax: Double,
                location: String) {
        self.temp = temp
        self.main = main
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.location = location
    }
}
