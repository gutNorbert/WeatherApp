//
//  MainViewPreview.swift
//  
//
//  Created by Norbert Gutpinter on 08/07/2024.
//

import Foundation
import DomainLayer

public class MainViewModelPreview: MainViewModelProtocol {
    public var currentWeatherData: CurrentWeatherResponse?
    
    public func currentWeather() {}
    
    public init() {
        currentWeatherData = CurrentWeatherResponse(temp: 26, main: "Clear")
    }
}
