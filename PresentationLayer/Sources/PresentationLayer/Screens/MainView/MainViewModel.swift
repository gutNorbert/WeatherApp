//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Observation
import DomainLayer
import Combine
import CoreLocation

public protocol MainViewModelProtocol: ObservableObject {
    var state: ViewState { get }
}

@Observable
public class MainViewModel: MainViewModelProtocol {
    //MARK: Dependencies
    
    @ObservationIgnored
    private let getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, UseCaseError>>
    private let getCurrentLocation: UseCaseWithoutRequestWrapper<PassthroughSubject<CLLocation, Never>>
    private let locationAuthorizationStatus: UseCaseWithoutRequestWrapper<CurrentValueSubject<CLAuthorizationStatus, Never>>
    private let startUpdatingLocation: UseCaseWithoutRequestAndResponse
    private let requestLocationAuthorization: UseCaseWithoutRequestAndResponse
    
    //MARK: Observed properties
    
    private var cancellables = Set<AnyCancellable>()
    public var state: ViewState = .loading
    
    //MARK: Init
    
    public init(getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, UseCaseError>>,
                getCurrentLocation: UseCaseWithoutRequestWrapper<PassthroughSubject<CLLocation, Never>>,
                locationAuthorizationStatus: UseCaseWithoutRequestWrapper<CurrentValueSubject<CLAuthorizationStatus, Never>>,
                startUpdatingLocation: UseCaseWithoutRequestAndResponse,
                requestLocationAuthorization: UseCaseWithoutRequestAndResponse) {
        self.getCurrentWeather = getCurrentWeather
        self.getCurrentLocation = getCurrentLocation
        self.locationAuthorizationStatus = locationAuthorizationStatus
        self.startUpdatingLocation = startUpdatingLocation
        self.requestLocationAuthorization = requestLocationAuthorization
        
        checkLocationAuthorization()
    }
    
    //MARK: Private functions
    
    private func checkLocationAuthorization() {
        locationAuthorizationStatus.execute().sink { [weak self] status in
            switch status {
            case .notDetermined, .denied:
                self?.requestLocationAuthorization.execute()
            default:
                self?.startUpdatingLocation.execute()
                self?.currentWeather()
            }
        }.store(in: &cancellables)
    }
    
    private func currentWeather() {
        
        getCurrentLocation.execute()
            .flatMap { [weak self] location -> AnyPublisher<CurrentWeatherResponse, UseCaseError> in
                guard let self = self else {
                    return Fail(error: UseCaseError.invalidInput("Self is nil")).eraseToAnyPublisher()
                }
                
                self.send(event: .load)
                let request = CurrentWeatherRequest(latitude: location.coordinate.latitude,
                                                    longitude: location.coordinate.longitude)
                return self.getCurrentWeather.execute(request: request)
            }
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    switch failure {
                    case .repositoryError(_):
                        self?.send(event: .fail("Repo Error"))
                    case .invalidInput(_):
                        self?.send(event: .fail("Input error"))
                    }
                }
            }, receiveValue: { [weak self] weather in
                self?.send(event: .succeed(weather))
            })
            .store(in: &cancellables)
    }
    
    private func send(event: ViewEvent) {
        switch (state, event) {
        case (.loading, .succeed(let weather)):
            state = .success(weather)
        case (.loading, .fail(let error)):
            state = .failure(error)
        case (.success, .load), (.failure, .load):
            state = .loading
        default:
            break
        }
    }
}
