//
//  UseCaseError.swift
//  
//
//  Created by Norbert Gutpinter on 15/07/2024.
//

import Foundation

public enum UseCaseError: Error {
    case repositoryError(RepositoryError)
    case invalidInput(String)
}
