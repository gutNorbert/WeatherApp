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
    
    init(repository: CurrentWeatherRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(request: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, Never> {
        repository.getCurrentWeather(currentWeatherRequest: request)
    }
}


public class GetASD {
    public static func asd() {
        
    }
}
