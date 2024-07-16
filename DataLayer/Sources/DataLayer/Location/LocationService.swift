//
//  LocationService.swift
//
//
//  Created by Norbert Gutpinter on 10/07/2024.
//

import Foundation
import CoreLocation
import Combine

public protocol LocationServiceProtocol {
    var locationSubject: PassthroughSubject<CLLocation, Never> { get }
    var authorizationStatusSubject: CurrentValueSubject<CLAuthorizationStatus, Never> { get }
    func requestLocation()
    func requestAuthorization()
    func startUpdatingLocation()
}

@Observable
public final class LocationService: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
    private let locationManager = CLLocationManager()
    public var locationSubject = PassthroughSubject<CLLocation, Never>()
    public var authorizationStatusSubject = CurrentValueSubject<CLAuthorizationStatus, Never>(.notDetermined)
    
    public override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.distanceFilter = 100
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationSubject.send(location)
        }
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = locationManager.authorizationStatus
        authorizationStatusSubject.send(status)
    }
    
    public func requestLocation() {
        locationManager.requestLocation()
    }
    
    public func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error \(error.localizedDescription)")
    }
}
