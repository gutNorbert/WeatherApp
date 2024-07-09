//
//  ViewEvent.swift
//
//
//  Created by Norbert Gutpinter on 09/07/2024.
//

import Foundation
import DomainLayer

enum ViewEvent {
    case load
    case succeed(CurrentWeatherResponse)
    case fail(String)
}
