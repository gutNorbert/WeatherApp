//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import SwiftUI
import PresentationLayer
import Factory

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            if let mainView = Container.shared.mainView.resolve() as? MainView {
                AnyView(mainView)
            } else {
                Text("Error loading view")
            }
        }
    }
}
