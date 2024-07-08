//
//  MainView.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import SwiftUI

public protocol MainvViewProtocol: View {}

public struct MainView: MainvViewProtocol {
    public init(viewModel: any MainViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    @State public var viewModel: any MainViewModelProtocol
    
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
    MainView(viewModel: MainViewModel())
}
