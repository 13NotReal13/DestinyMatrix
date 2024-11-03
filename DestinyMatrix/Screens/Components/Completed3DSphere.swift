//
//  Completed3DSphere.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct Completed3DSphere: View {
    @StateObject var homeViewModel: HomeViewModel
    @StateObject var audioVusualizer: AudioVisualizer
    
    @State private var size: CGFloat = 0.8
    
    var amplitudes: [CGFloat]
    var onboardingIsFinished: Bool
    
    var colorOfEqualizer: Color = .cyan
    var shadowColorOfEqualizer: Color = .white
    var offsetDistanceOfEqualizer: CGFloat = -121
    
    var imageName: String = ShapeOfSphere.shapeName.rawValue
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                if homeViewModel.currentScreen != .onboarding {
                    Text("Матрица Судьбы")
                        .customText(fontSize: 28, textColor: .white)
                    
                    Text("Ваш путь к успеху и изобилию")
                        .customText(fontSize: 12, textColor: .white)
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.05)
            
            ZStack {
                if audioVusualizer.isPlaying {
                    CircularEqualizerView(
                        amplitudes: amplitudes,
                        color: colorOfEqualizer,
                        shadowColor: shadowColorOfEqualizer,
                        offsetDistance: offsetDistanceOfEqualizer
                    )
                }
                
                Rotating3DSphereView(imageName: imageName)
                    .frame(width: UIScreen.main.bounds.width * size, height: UIScreen.main.bounds.width * size)
                
                Circle()
                    .stroke(lineWidth: 4)
                    .frame(width: UIScreen.main.bounds.width * (size - 0.2))
                    .foregroundStyle(.lightAroundSphere)
                    .shadow(color: .yellow, radius: 10)
                
                Circle()
                    .stroke(lineWidth: 0.1)
                    .frame(width: UIScreen.main.bounds.width * (size - 0.05))
                    .foregroundStyle(.lightAroundSphere)
                
                VStack {
                    if homeViewModel.currentScreen != .onboarding  {
                        DateAround3DSphere(customFont: CustomFont.fontName)
                        Spacer()
                    }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}

#Preview {
    Completed3DSphere(
        homeViewModel: HomeViewModel(),
        audioVusualizer: AudioVisualizer(),
        amplitudes: [],
        onboardingIsFinished: true
    )
}
