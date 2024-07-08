//
//  DI+Presentation.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 03/07/2024.
//

import Foundation
import Factory
import PresentationLayer

extension Container {
    //MARK: Views
    var mainView: Factory<any MainvViewProtocol> {
        self { MainView(viewModel: self.mainViewModel()) }
    }
    
    //MARK: ViewModels
    var mainViewModel: Factory<any MainViewModelProtocol> {
        self { MainViewModel() }
    }
}
