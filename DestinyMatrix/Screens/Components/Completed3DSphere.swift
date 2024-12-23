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
    
    @State private var size: CGFloat = 0.8
    
    private var colorOfEqualizer: Color = .cyan
    private var shadowColorOfEqualizer: Color = .white
    private var offsetDistanceOfEqualizer: CGFloat = -121
    
    private var imageName: String = ShapeOfSphere.shapeName.rawValue
    
    var body: some View {
        VStack {            
            VStack(spacing: 10) {
            }
            .frame(height: UIScreen.main.bounds.height * 0.05)
            
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
                    .shadow(color: .yellow, radius: 10)
                
                Circle()
                    .stroke(lineWidth: 0.1)
                    .frame(width: UIScreen.main.bounds.width * (size - 0.05))
                    .foregroundStyle(.lightAroundSphere)
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        Completed3DSphere()
            .environmentObject(HomeViewModel(storageManager: StorageManager()))
            .environmentObject(AudioVisualizer())
    }
}
