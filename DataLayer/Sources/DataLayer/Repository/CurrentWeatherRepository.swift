//
//  CurrentWeatherRepository.swift
//  DataLayer
//
//  Created by Valentin Taradaj on 28/06/2024.
//

import Foundation
import DomainLayer
import Combine

public struct CurrentWeatherRepository: CurrentWeatherRepositoryProtocol {
    private let remoteDataSource: CurrentWeatherRemoteDataSourceProtocol
    
    public init(remoteDataSource: CurrentWeatherRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getCurrentWeather(currentWeatherRequest: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, Never> {
        remoteDataSource.fetchCurrentWeather(with: CurrentWeatherRequestDTO.from(weather: currentWeatherRequest)).map { dto in
            CurrentWeatherResponse.from(response: dto)
        }.catch { _ in Just(CurrentWeatherResponse(temp: 35, main: "", tempMin: 32, tempMax: 40, location: ""))
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
