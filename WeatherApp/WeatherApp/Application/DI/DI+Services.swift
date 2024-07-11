//
//  DI+Services.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Factory
import DataLayer

extension Container {
    //MARK: Web
    var httpClient: Factory<any APIClient> {
        self { HTTPClient() }.singleton
    }
    
    //MARK: Location
    var locationService: Factory<any LocationServiceProtocol> {
        self { LocationService() }.singleton
    }
}
