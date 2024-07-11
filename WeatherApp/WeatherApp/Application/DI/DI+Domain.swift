//
//  DI+Domain.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Factory
import DomainLayer
import Combine
import CoreLocation

extension Container {
    //MARK: UseCase
    var getCurrentWeather: Factory<UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>> {
        self { UseCaseWrapper(GetCurrentWeather(repository: self.currentWeatherRepository()))}
    }
    
    var getCurrentLocation: Factory<UseCaseWithoutRequestWrapper<PassthroughSubject<CLLocation, Never>>> {
        self { UseCaseWithoutRequestWrapper(GetCurrentLocation(repository: self.locationRepository()))}
    }
    
    var requestLocation: Factory<UseCaseWithoutRequestAndResponse> {
        self { RequestLocation(repository: self.locationRepository())}
    }
}
