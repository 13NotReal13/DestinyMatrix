//
//  Completed3DSphere.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct Completed3DSphere: View {
    var amplitudes: [CGFloat]
    var colorOfEqualizer: Color
    var shadowColorOfEqualizer: Color
    var offsetDistanceOfEqualizer: CGFloat
    
    var imageName: String
    
    @State private var size: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            CircularEqualizerView(
                amplitudes: amplitudes,
                color: colorOfEqualizer,
                shadowColor: shadowColorOfEqualizer,
                offsetDistance: offsetDistanceOfEqualizer
            )
            
            Rotating3DSphereView(iamegName: imageName)
                .frame(width: UIScreen.main.bounds.width * size, height: UIScreen.main.bounds.width * size)
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
