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
    func currentWeather()
}

@Observable
public class MainViewModel: MainViewModelProtocol {
    private let getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>
    private var cancellables = Set<AnyCancellable>()
    
    public init(getCurrentWeather: UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>) {
        self.getCurrentWeather = getCurrentWeather
    }
    
    public func currentWeather() {
        getCurrentWeather.execute(request: CurrentWeatherRequest(latitude: 25.2, longitude: 22.2))
            .sink { completion in
                switch completion {
                case .finished:
                    print("Successfully received weather data.")
                case .failure(let error):
                    print("Failed to fetch weather data: \(error.localizedDescription)")
                }
            } receiveValue: { weather in
                print(weather.main)
            }.store(in: &cancellables)

    }
}
