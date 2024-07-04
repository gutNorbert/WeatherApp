//
//  MainView.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import SwiftUI

public struct MainView: View {
    public init() {}
//    @State private var viewModel = MainViewModel()
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
//                    viewModel.getCurrentWeather()
                }
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
