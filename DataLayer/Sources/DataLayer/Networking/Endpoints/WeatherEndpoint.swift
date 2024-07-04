//
//  WeatherEndpoint.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation

enum WeatherEndpoint {
    case currentWeather
}

extension WeatherEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .currentWeather:
            return "/data/2.5/weather"
        }
    }

    var method: RequestMethod {
        switch self {
        case .currentWeather:
            return .get
        }
    }
}
