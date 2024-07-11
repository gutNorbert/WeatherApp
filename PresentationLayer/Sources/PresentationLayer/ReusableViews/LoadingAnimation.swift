//
//  LoadingAnimation.swift
//
//
//  Created by Norbert Gutpinter on 10/07/2024.
//

import SwiftUI
import Lottie

struct LoadingAnimation: View {
    var body: some View {
        LottieView(animation: .named("loading", bundle: Bundle.module))
            .playing(loopMode: .loop)
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}
