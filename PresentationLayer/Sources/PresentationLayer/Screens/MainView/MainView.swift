//
//  MainView.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import SwiftUI
import Lottie
import DomainLayer

public protocol MainvViewProtocol: View {}

public struct MainView: MainvViewProtocol {
    @State public var viewModel: any MainViewModelProtocol
    
    public init(viewModel: any MainViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            backgroundView
            contentView
        }
    }
    
    private var backgroundView: some View {
        LottieView(animation: .named("nature_background", bundle: Bundle.module))
            .playing(loopMode: .loop)
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    private var loadingView: some View {
        LottieView(animation: .named("loading", bundle: Bundle.module))
            .playing(loopMode: .loop)
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    private var contentView: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                loadingView
                    .frame(width: 200, height: 200, alignment: .center)
            case .success(let weatherData):
                CurrentWeatherTopView(weather: weatherData)
                Spacer()
            case .failure(let error):
                Text("Error: \(error)")
            }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModelPreview(state: .loading)).previewDisplayName("Loading")
}

#Preview {
    MainView(viewModel: MainViewModelPreview(state: .success(CurrentWeatherResponse(temp: 35, main: "Cloudy", tempMin: 22, tempMax: 40, location: "Budapest")))).previewDisplayName("Loaded")
}
