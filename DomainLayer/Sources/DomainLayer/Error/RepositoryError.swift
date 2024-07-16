//
//  RepositoryError.swift
//
//
//  Created by Norbert Gutpinter on 15/07/2024.
//

import Foundation

public enum RepositoryError: Error {
    case networkError(HTTPError)
    //... DB Error and so on
    case invalidData(String)
}
