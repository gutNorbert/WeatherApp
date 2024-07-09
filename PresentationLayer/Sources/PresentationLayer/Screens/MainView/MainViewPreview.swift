//
//  MainViewPreview.swift
//  
//
//  Created by Norbert Gutpinter on 08/07/2024.
//

import Foundation
import DomainLayer

public class MainViewModelPreview: MainViewModelProtocol {
    public var state: ViewState
    
    public init(state: ViewState) {
        self.state = state
    }
}
