//
//  DI+Presentation.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 03/07/2024.
//

import Foundation
import Factory
import PresentationLayer
import DomainLayer
import DataLayer
import Combine

extension Container {
    //MARK: Views
    var mainView: Factory<any MainvViewProtocol> {
        self { MainView(viewModel: self.mainViewModel()) }
    }
    
    //MARK: ViewModels
    var mainViewModel: Factory<any MainViewModelProtocol> {
        self { MainViewModel(getCurrentWeather: self.getCurrentWeather()) }
    }
    
    //MARK: UseCase
    var getCurrentWeather: Factory<UseCaseWrapper<CurrentWeatherRequest, AnyPublisher<CurrentWeatherResponse, Never>>> {
        self { UseCaseWrapper(GetCurrentWeather(repository: self.currentWeatherRepository()))}
    }
    
    var currentWeatherRepository: Factory<any CurrentWeatherRepositoryProtocol> {
        self { CurrentWeatherRepository(remoteDataSource: self.currentWeatherRemoteDataSource())}
    }
    
    var currentWeatherRemoteDataSource: Factory<any CurrentWeatherRemoteDataSourceProtocol> {
        self { CurrentWeatherRemoteDataSource(apiClient: self.httpClient())}
    }
    
    var httpClient: Factory<any APIClient> {
        self { HTTPClient() }
    }
}
