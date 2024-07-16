//
//  RequestLocation.swift
//  
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Foundation

public class RequestLocation: UseCaseWithoutRequestAndResponse {
    private let repository: LocationRepositoryProtocol
    
    public init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() {
        repository.requestLocation()
    }
}
