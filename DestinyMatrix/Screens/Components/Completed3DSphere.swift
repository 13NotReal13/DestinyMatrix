//
//  Completed3DSphere.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct Completed3DSphere: View {
    @State private var size: CGFloat = 0.8
    
    var amplitudes: [CGFloat]
    var colorOfEqualizer: Color
    var shadowColorOfEqualizer: Color
    var offsetDistanceOfEqualizer: CGFloat
    
    var imageName: String
    
    var body: some View {
        ZStack {
//            AnimatedStarryBackgroundView()
            
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
            
        }
    }
}

#Preview {
    Completed3DSphere(
        amplitudes: [],
        colorOfEqualizer: Color.cyan,
        shadowColorOfEqualizer: Color.white,
        offsetDistanceOfEqualizer: CGFloat(-150),
        imageName: Shape.shape9.rawValue
    )
}
