//
//  CurrentWeatherRepository.swift
//  DataLayer
//
//  Created by Valentin Taradaj on 28/06/2024.
//

import Foundation
import DomainLayer
import Combine
import Factory

struct CurrentWeatherRepository: CurrentWeatherRepositoryProtocol{
    private let remoteDataSource = Container.shared.currentWeatherRemoteDataSource.resolve()
    
    func getCurrentWeather(currentWeatherRequest: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, Never> {
        remoteDataSource.fetchCurrentWeather(with: CurrentWeatherRequestDTO.from(weather: currentWeatherRequest)).map { dto in
            CurrentWeatherResponse(temp: dto.main.temp, main: dto.weather[0].main)
        }.catch { _ in Just(CurrentWeatherResponse(temp: 0, main: ""))
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
