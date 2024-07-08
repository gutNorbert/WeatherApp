//
//  CurrentWeatherRemoteDataSourceProtocol.swift
//  DataLayer
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Combine

public protocol CurrentWeatherRemoteDataSourceProtocol {
    func fetchCurrentWeather(with request: CurrentWeatherRequestDTO) -> Future<CurrentWeatherResponseDTO, RequestError>
}
