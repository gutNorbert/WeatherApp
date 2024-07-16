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
    var getCurrentWeather: Factory<UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, UseCaseError>>> {
        self { UseCaseWrapper(GetCurrentWeather(repository: self.currentWeatherRepository()))}
    }
    
    var getCurrentLocation: Factory<UseCaseWithoutRequestWrapper<PassthroughSubject<CLLocation, Never>>> {
        self { UseCaseWithoutRequestWrapper(GetCurrentLocation(repository: self.locationRepository()))}
    }
    
    var locationAuthorizationStatus: Factory<UseCaseWithoutRequestWrapper<CurrentValueSubject<CLAuthorizationStatus, Never>>> {
        self { UseCaseWithoutRequestWrapper(CheckLocationAuthorizationStatus(repository: self.locationRepository()))}
    }
    
    var startUpdatingLocation: Factory<UseCaseWithoutRequestAndResponse> {
        self { StartUpdatingLocation(repository: self.locationRepository())}
    }
    
    var requestLocationAuthorization: Factory<UseCaseWithoutRequestAndResponse> {
        self { RequestLocationAuthorization(repository: self.locationRepository())}
    }
}
