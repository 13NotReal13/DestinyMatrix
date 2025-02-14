//
//  Completed3DSphere.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct Completed3DSphere: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @EnvironmentObject private var audioVusualizer: AudioVisualizer
    
    @State private var size: CGFloat = 0.7
    
    private var colorOfEqualizer: Color = .cyan
    private var shadowColorOfEqualizer: Color = .white
    
    private var offsetDistanceOfEqualizer: CGFloat {
        UIScreen.main.bounds.width * -0.23 // Процент от ширины экрана
    }
    
    private var imageName: String = ShapeOfSphere.shapeName.rawValue
    
    var body: some View {
        VStack {
            ZStack {
                if audioVusualizer.isPlaying {
                    CircularEqualizerView(
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
                    .shadow(color: .cyan, radius: 10)
                
                Circle()
                    .stroke(lineWidth: 0.1)
                    .frame(width: UIScreen.main.bounds.width * (size - 0.05))
                    .foregroundStyle(.cyan)
            }
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        Completed3DSphere()
            .environmentObject(AudioVisualizer())
    }
}
