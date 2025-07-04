//
//  GetCurrentWeather.swift
//  DomainLayer
//
//  Created by Valentin Taradaj on 28/06/2024.
//

import Foundation
import Combine

public class GetCurrentWeather: UseCase {
    private let repository: CurrentWeatherRepositoryProtocol
    
    public init(repository: CurrentWeatherRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(request: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, UseCaseError> {
        repository.getCurrentWeather(currentWeatherRequest: request)
    }
}
