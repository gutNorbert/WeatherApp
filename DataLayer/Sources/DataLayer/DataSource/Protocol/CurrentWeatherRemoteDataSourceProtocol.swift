//
//  CurrentWeatherRemoteDataSourceProtocol.swift
//  DataLayer
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Combine
import DomainLayer

public protocol CurrentWeatherRemoteDataSourceProtocol {
    func fetchCurrentWeather(with request: CurrentWeatherRequestDTO) -> AnyPublisher<CurrentWeatherResponseDTO, RepositoryError>
}
