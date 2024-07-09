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
    var currentWeatherData: CurrentWeatherResponse? { get }
    func currentWeather()
}

@Observable
public class MainViewModel: MainViewModelProtocol {
    @ObservationIgnored
    private let getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>
    
    private var cancellables = Set<AnyCancellable>()
    public var currentWeatherData: CurrentWeatherResponse?
    
    public init(getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>) {
        self.getCurrentWeather = getCurrentWeather
        currentWeather()
    }
    
    public func currentWeather() {
        getCurrentWeather.execute(request: CurrentWeatherRequest(latitude: 25.2, longitude: 22.2))
            .sink ( receiveValue: { [weak self] weather in
                self?.currentWeatherData = weather
            }).store(in: &cancellables)
    }
}
