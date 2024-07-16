//
//  GetCurrentLocation.swift
//
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Foundation
import Combine
import CoreLocation

public class GetCurrentLocation: UseCaseWithoutRequest {
    private let repository: LocationRepositoryProtocol
    
    public init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() -> PassthroughSubject<CLLocation, Never> {
        repository.getCurrentLocation()
    }
}
