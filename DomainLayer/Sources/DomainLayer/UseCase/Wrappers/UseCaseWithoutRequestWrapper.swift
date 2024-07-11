//
//  UseCaseWithoutRequestWrapper.swift
//  
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Foundation

public class UseCaseWithoutRequestWrapper<Response>: UseCaseWithoutRequest {
    private let _execute: () -> Response
    
    public init<U: UseCaseWithoutRequest>(_ useCase: U) where U.Response == Response {
        self._execute = useCase.execute
    }
    
    public func execute() -> Response {
        return _execute()
    }
}
