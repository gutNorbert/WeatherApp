//
//  GetCurrentWeather.swift
//  DomainLayer
//
//  Created by Valentin Taradaj on 28/06/2024.
//

import Foundation
import Combine

class GetCurrentWeather: UseCase {
    private let repository: CurrentWeatherRepositoryProtocol
    
    init(repository: CurrentWeatherRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(request: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, Never> {
        repository.getCurrentWeather(currentWeatherRequest: request)
    }
}
