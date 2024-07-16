//
//  LocationRepository.swift
//
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Foundation
import Combine
import CoreLocation
import DomainLayer

public struct LocationRepository: LocationRepositoryProtocol {
    private let locationService: LocationServiceProtocol
    
    public init(locationService: LocationServiceProtocol) {
        self.locationService = locationService
    }
    
    public func requestLocation() {
        locationService.requestLocation()
    }
    
    public func getCurrentLocation() -> PassthroughSubject<CLLocation, Never> {
        locationService.locationSubject
    }
    
    public func authorizationStatus() -> CurrentValueSubject<CLAuthorizationStatus, Never> {
        locationService.authorizationStatusSubject
    }
    
    public func requestAuthorization() {
        locationService.requestAuthorization()
    }
    
    public func startUpdatingLocation() {
        locationService.startUpdatingLocation()
    }
}
