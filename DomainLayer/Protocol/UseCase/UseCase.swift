//
//  UseCase.swift
//  DomainLayer
//
//  Created by Valentin Taradaj on 01/07/2024.
//

import Foundation

protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request) -> Response
}
