//
//  LocationRepositoryProtocol.swift
//
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Foundation
import Combine
import CoreLocation

public protocol LocationRepositoryProtocol {
    func requestLocation()
    func getCurrentLocation() -> PassthroughSubject<CLLocation, Never>
    func authorizationStatus() -> CurrentValueSubject<CLAuthorizationStatus, Never>
    func requestAuthorization()
    func startUpdatingLocation()
}
