//
//  CheckLocationAuthorizationStatus.swift
//
//
//  Created by Norbert Gutpinter on 15/07/2024.
//

import Foundation
import Combine
import CoreLocation


public class CheckLocationAuthorizationStatus: UseCaseWithoutRequest {
    private let repository: LocationRepositoryProtocol
    
    public init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() -> CurrentValueSubject<CLAuthorizationStatus, Never> {
        repository.authorizationStatus()
    }
}
