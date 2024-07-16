//
//  CurrentWeatherRemoteDataSource.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Combine
import DomainLayer

public class CurrentWeatherRemoteDataSource: CurrentWeatherRemoteDataSourceProtocol {
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func fetchCurrentWeather(with request: CurrentWeatherRequestDTO) -> AnyPublisher<CurrentWeatherResponseDTO, RepositoryError> {
        apiClient.sendRequest(endpoint: WeatherEndpoint.currentWeather,
                              responseModel: CurrentWeatherResponseDTO.self,
                              queries: [URLQueryItem(name: "lat", value: String(request.latitude)),
                                        URLQueryItem(name: "lon", value: String(request.longitude)),
                                        URLQueryItem(name: "appid", value: "970c3e370ab8a006ca61dc609fd75f6c"),
                                        URLQueryItem(name: "units", value: "metric")])
        .mapError { httpError in
            RepositoryError.networkError(httpError)
        }
        .eraseToAnyPublisher()
    }
}
