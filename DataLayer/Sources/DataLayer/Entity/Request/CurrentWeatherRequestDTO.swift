//
//  CurrentWeatherRequestDTO.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import DomainLayer

public struct CurrentWeatherRequestDTO {
    public let latitude: Double
    public let longitude: Double
}

extension CurrentWeatherRequestDTO {
    static func from(weather: CurrentWeatherRequest) -> CurrentWeatherRequestDTO {
        return CurrentWeatherRequestDTO(latitude: weather.latitude, longitude: weather.longitude)
    }
}
