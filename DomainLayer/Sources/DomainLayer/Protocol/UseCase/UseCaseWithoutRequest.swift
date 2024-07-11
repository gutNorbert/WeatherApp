//
//  UseCaseWithoutRequest.swift
//  
//
//  Created by Norbert Gutpinter on 11/07/2024.
//

import Foundation

public protocol UseCaseWithoutRequest {
    associatedtype Response
    
    func execute() -> Response
}
