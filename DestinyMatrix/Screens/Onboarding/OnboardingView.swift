//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var audioVisualizer = AudioVisualizer()
    
    private var colorOfEqualizer = Color.white
    private var offsetDistanceOfEqualizer: CGFloat = -110
    private var shadowColorOfEqualizer = Color.yellow
    
    var body: some View {
        VStack {
            ZStack {
                Image(.background)
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        CircularEqualizerView(
                            amplitudes: audioVisualizer.amplitudes,
                            color: colorOfEqualizer,
                            shadowColor: shadowColorOfEqualizer,
                            offsetDistance: offsetDistanceOfEqualizer
                        )
                        
                        Rotating3DSphereView()
                            .frame(width: 300, height: 300)
                    }
                    
                    Text("djsns")
                        .foregroundStyle(.white)
                }
            }
//            .onAppear {
//                if let audioURL = Bundle.main.url(forResource: "CharlotteOnboarding", withExtension: ".mp3") {
//                    audioVisualizer.start()
//                    audioVisualizer.playAudio(url: audioURL)
//                }
//            }
            .onDisappear {
                audioVisualizer.stop()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
