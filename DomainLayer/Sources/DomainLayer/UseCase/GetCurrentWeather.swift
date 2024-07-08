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
    
    public func execute(request: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, Never> {
        repository.getCurrentWeather(currentWeatherRequest: request)
    }
}


public class UseCaseWrapper<Request, Response>: UseCase {
    private let _execute: (Request) -> Response
    
    public init<U: UseCase>(_ useCase: U) where U.Request == Request, U.Response == Response {
        self._execute = useCase.execute
    }
    
    public func execute(request: Request) -> Response {
        return _execute(request)
    }
}
