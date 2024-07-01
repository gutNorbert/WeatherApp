//
//  CurrentWeatherRepository.swift
//  DataLayer
//
//  Created by Valentin Taradaj on 28/06/2024.
//

import Foundation
import DomainLayer
import Combine

struct CurrentWeatherRepository: CurrentWeatherRepositoryProtocol{
    
    private let datasource: CurrentWeatherRemoteDataSource
    
    init(datasource: CurrentWeatherRemoteDataSource) {
        self.datasource = datasource
    }
    
    func getCurrentWeather(currentWeatherRequest: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, Never> {
        datasource.fetchCurrentWeather(with: CurrentWeatherRequestDTO.from(weather: currentWeatherRequest)).map { dto in
            CurrentWeatherResponse(temp: dto.main.temp, main: dto.weather[0].main)
        }.catch { _ in Just(CurrentWeatherResponse(temp: 0, main: ""))
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
