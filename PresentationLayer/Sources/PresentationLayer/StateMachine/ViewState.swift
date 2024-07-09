//
//  ViewState.swift
//
//
//  Created by Norbert Gutpinter on 09/07/2024.
//

import Foundation
import DomainLayer

public enum ViewState {
    case loading
    case success(CurrentWeatherResponse)
    case failure(String)
}
