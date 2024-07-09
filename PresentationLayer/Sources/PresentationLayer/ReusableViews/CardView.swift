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

            Text(title)
                .font(.headline)
                .padding()
            Text(descriptionTop)
                .font(.headline)
                .padding()

            Text(descriptionBottom)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .padding(.bottom, 10)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        .padding()
        .padding(.horizontal)
    }
}
