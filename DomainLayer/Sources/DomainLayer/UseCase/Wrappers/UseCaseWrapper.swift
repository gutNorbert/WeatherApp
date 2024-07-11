//
//  UseCaseWrapper.swift
//
//
//  Created by Norbert Gutpinter on 09/07/2024.
//

import Foundation

public class UseCaseWrapper<Request, Response>: UseCase {
    private let _execute: (Request) -> Response
    
    public init<U: UseCase>(_ useCase: U) where U.Request == Request, U.Response == Response {
        self._execute = useCase.execute
    }
    
    public func execute(request: Request) -> Response {
        return _execute(request)
    }
}
