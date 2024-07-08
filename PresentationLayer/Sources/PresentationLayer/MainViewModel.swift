//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Observation

public protocol MainViewModelProtocol: ObservableObject {
    
}

@Observable
public class MainViewModel: MainViewModelProtocol {
    public init() {}
    
    func getCurrentWeather() {
//        GetASD.asd()
        
    }
}
