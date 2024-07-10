//
//  CurrentWeatherTopView.swift
//
//
//  Created by Norbert Gutpinter on 10/07/2024.
//

import SwiftUI
import DomainLayer

struct CurrentWeatherTopView: View {
    
    let weather: CurrentWeatherResponse
    
    var body: some View {
        VStack {
            Text("Current location")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text(weather.location)
                .font(.title2)
                .foregroundColor(.white)
            
            Text("\(weather.temp, specifier: "%.2f")°C")
                .font(.system(size: 64, weight: .thin))
                .foregroundColor(.white)
            
            Text(weather.main)
                .font(.title2)
                .foregroundColor(.white)
            
            Text("Max: \(weather.tempMax, specifier: "%.2f")°C Min: \(weather.tempMin, specifier: "%.2f")°C ")
                .font(.headline)
                .foregroundColor(.white)
        }.padding()
            .background(Color.black.opacity(0.5))
            .cornerRadius(15)
            .shadow(radius: 5)
    }
}

#Preview {
    VStack {
        CurrentWeatherTopView(weather: CurrentWeatherResponse(temp: 35, main: "Cloudy", tempMin: 22, tempMax: 40, location: "Budapest"))
    }.background(Color.blue)
}
