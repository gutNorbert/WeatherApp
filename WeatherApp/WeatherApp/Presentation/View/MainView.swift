//
//  MainView.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import SwiftUI

struct MainView: View {
    @State private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
                    viewModel.getCurrentWeather()
                }
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
