//
//  CurrentWeatherRepositoryProtocol.swift
//  DomainLayer
//
//  Created by Valentin Taradaj on 28/06/2024.
//

import Foundation
import Combine

public protocol CurrentWeatherRepositoryProtocol {
    
    func getCurrentWeather(currentWeatherRequest: CurrentWeatherRequest) -> AnyPublisher<CurrentWeatherResponse, Never>
}
