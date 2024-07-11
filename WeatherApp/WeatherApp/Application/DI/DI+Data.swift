//
//  DI+Data.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Factory
import DataLayer
import DomainLayer

extension Container {
    //MARK: Repository
    var currentWeatherRepository: Factory<any CurrentWeatherRepositoryProtocol> {
        self { CurrentWeatherRepository(remoteDataSource: self.currentWeatherRemoteDataSource())}
    }

    var locationRepository: Factory<any LocationRepositoryProtocol> {
        self { LocationRepository(locationService: self.locationService())}
    }

    //MARK: Data source
    var currentWeatherRemoteDataSource: Factory<any CurrentWeatherRemoteDataSourceProtocol> {
        self { CurrentWeatherRemoteDataSource(apiClient: self.httpClient())}
    }
}

