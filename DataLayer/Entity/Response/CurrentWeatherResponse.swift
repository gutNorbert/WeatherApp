//
//  CurrentWeatherResponse.swift
//  DataLayer
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation

struct CurrentWeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
