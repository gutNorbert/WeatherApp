//
//  CurrentWeatherRemoteDataSource.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Factory
import Combine

class CurrentWeatherRemoteDataSource: CurrentWeatherRemoteDataSourceProtocol {
    private let apiClient = Container.shared.apiClient.resolve()
    
    func fetchCurrentWeather(with request: CurrentWeatherRequest) -> Future<CurrentWeatherResponse, RequestError> {
        apiClient.sendRequest(endpoint: WeatherEndpoint.currentWeather,
                              responseModel: CurrentWeatherResponse.self,
                              queries: [URLQueryItem(name: "lat", value: "44.34"),
                                        URLQueryItem(name: "lon", value: "10.99")])
        
    }
}
