//
//  DI+Presentation.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 03/07/2024.
//

import Factory
import PresentationLayer
import Combine

extension Container {
    //MARK: Views
    var mainView: Factory<any MainvViewProtocol> {
        self { MainView(viewModel: self.mainViewModel()) }
    }
    
    //MARK: ViewModels
    var mainViewModel: Factory<any MainViewModelProtocol> {
        self { MainViewModel(getCurrentWeather: self.getCurrentWeather(),
                             getCurrentLocation: self.getCurrentLocation(),
                             locationAuthorizationStatus: self.locationAuthorizationStatus(),
                             startUpdatingLocation: self.startUpdatingLocation(),
                             requestLocationAuthorization: self.requestLocationAuthorization()) }
    }
}
