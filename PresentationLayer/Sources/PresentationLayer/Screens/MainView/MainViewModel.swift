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

public protocol MainViewModelProtocol: ObservableObject {
    var state: ViewState { get }
}

@Observable
public class MainViewModel: MainViewModelProtocol {
    //MARK: Dependencies
    
    @ObservationIgnored
    private let getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>
    
    //MARK: Observed properties
    
    private var cancellables = Set<AnyCancellable>()
    public var state: ViewState = .loading
    
    //MARK: Init
    
    public init(getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>) {
        self.getCurrentWeather = getCurrentWeather
        currentWeather()
    }
    
    //MARK: Private functions
    
    private func currentWeather() {
        getCurrentWeather.execute(request: CurrentWeatherRequest(latitude: 25.2, longitude: 22.2))
            .sink ( receiveValue: { [weak self] weather in
                self?.send(event: .succeed(weather))
            }).store(in: &cancellables)
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
