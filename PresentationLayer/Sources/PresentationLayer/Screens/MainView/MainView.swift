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
    public init(viewModel: any MainViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    @State public var viewModel: any MainViewModelProtocol
    
    public var body: some View {
        ZStack {
            LottieView(animation: .named("nature_background",
                                         bundle: Bundle.module))
                .playing()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                if let currentWeatherData = viewModel.currentWeatherData {
                    CardView(title: "Current weather",
                             descriptionTop: "Current celsius is: \(currentWeatherData.temp)",
                             descriptionBottom: "Desc")
                    Spacer()
                   
                }
            }.padding(.top, 30)
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModelPreview())
}
