//
//  DataDI.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Factory

extension Container {
    var apiClient: Factory<APIClient> {
        Factory(self) { HTTPClient() }.scope(.singleton)
    }
    
    var currentWeatherRemoteDataSource: Factory<CurrentWeatherRemoteDataSourceProtocol> {
        Factory(self) { CurrentWeatherRemoteDataSource() }
    }
}
