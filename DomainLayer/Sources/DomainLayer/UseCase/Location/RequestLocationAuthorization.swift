//
//  RequestLocationAuthorization.swift
//
//
//  Created by Norbert Gutpinter on 16/07/2024.
//

import Foundation

public class RequestLocationAuthorization: UseCaseWithoutRequestAndResponse {
    private let repository: LocationRepositoryProtocol
    
    public init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() {
        repository.requestAuthorization()
    }
}
