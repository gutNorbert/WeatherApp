//
//  CardView.swift
//
//
//  Created by Norbert Gutpinter on 09/07/2024.
//

import SwiftUI
import DomainLayer

struct CardView: View {
    var title: String
    var descriptionTop: String
    var descriptionBottom: String
    
    var body: some View {
        VStack(alignment: .center) {
//            CurrentWeatherTopView(location: "Budapest", temperature: "32", weatherDescription: "asd", highLowTemperature: "32", feelsLikeTemperature: "22")
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        .padding()
        .padding(.horizontal)
    }
}
