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
    private let getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>
    private let getCurrentLocation: UseCaseWithoutRequestWrapper<PassthroughSubject<CLLocation, Never>>
    private let requestLocation: UseCaseWithoutRequestAndResponse
    
    //MARK: Observed properties
    
    private var cancellables = Set<AnyCancellable>()
    public var state: ViewState = .loading
    
    //MARK: Init
    
    public init(getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>,
                getCurrentLocation: UseCaseWithoutRequestWrapper<PassthroughSubject<CLLocation, Never>>,
                requestLocation: UseCaseWithoutRequestAndResponse) {
        self.getCurrentWeather = getCurrentWeather
        self.getCurrentLocation = getCurrentLocation
        self.requestLocation = requestLocation
        
        requestLocation.execute()
        currentWeather()
    }
    
    //MARK: Private functions
    
    private func currentWeather() {
        
        getCurrentLocation.execute()
                    .flatMap { [weak self] location -> AnyPublisher<CurrentWeatherResponse, Never> in
                        let request = CurrentWeatherRequest(latitude: location.coordinate.latitude,
                                                            longitude: location.coordinate.longitude)
                        return (self?.getCurrentWeather.execute(request: request))!
                    }
                    .sink(receiveCompletion: { [weak self] completion in
                        
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
