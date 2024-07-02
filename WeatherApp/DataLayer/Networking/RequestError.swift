//
//  RequestError.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case responseError
    case badResponse(statusCode: Int)
}
