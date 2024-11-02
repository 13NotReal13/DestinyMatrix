//
//  Completed3DSphere.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct Completed3DSphere: View {
    @StateObject var viewModel: HomeViewModel
    @State private var size: CGFloat = 0.8
    
    var amplitudes: [CGFloat]
    var onboardingIsFinished: Bool
    
    var colorOfEqualizer: Color = .cyan
    var shadowColorOfEqualizer: Color = .white
    var offsetDistanceOfEqualizer: CGFloat = -110
    
    var imageName: String = Shape.shapeName.rawValue
    
    var body: some View {
        VStack {
            VStack {
                if viewModel.currentScreen != .onboarding {
                    Text("Матрица Судьбы")
                        .customText(fontSize: 28, textColor: .white)
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.05)
            
            ZStack {
                CircularEqualizerView(
                    amplitudes: amplitudes,
                    color: colorOfEqualizer,
                    shadowColor: shadowColorOfEqualizer,
                    offsetDistance: offsetDistanceOfEqualizer
                )
                
                
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
                    if viewModel.currentScreen != .onboarding  {
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
        viewModel: HomeViewModel(),
        amplitudes: [],
        onboardingIsFinished: true
    )
}
