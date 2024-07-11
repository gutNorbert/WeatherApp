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
    func requestLocation()
}

@Observable
public final class LocationService: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
    private let locationManager = CLLocationManager()
    public var locationSubject = PassthroughSubject<CLLocation, Never>()
    var authorizationStatus: CLAuthorizationStatus?
    
    public override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationSubject.send(location)
        }
    }
    
    public func requestLocation() {
        locationManager.requestLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error \(error.localizedDescription)")
    }
}
