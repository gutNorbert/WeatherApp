//
//  CurrentWeatherResponse.swift
//  DataLayer
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import DomainLayer

public struct CurrentWeatherResponseDTO: Decodable {
    public let weather: [Weather]
    public let main: Main
}

public struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
}

public struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

extension CurrentWeatherResponse {
    static func from(response: CurrentWeatherResponseDTO) -> Self {
        return CurrentWeatherResponse(temp: response.main.temp, main: response.weather[0].main)
    }
}
