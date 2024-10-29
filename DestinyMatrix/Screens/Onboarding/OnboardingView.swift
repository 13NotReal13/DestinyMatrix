//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

enum CustomFont: String {
    case blackcraft = "Blackcraft"
    case correctionBrush = "CorrectionBrush"
    case inkverse = "Inkverse"
}

enum Shape: String {
    case shape1 = "Shape1"
    case shape2 = "Shape2"
    case shape3 = "Shape3"
    case shape4 = "Shape4"
    case shape5 = "Shape5"
}

struct OnboardingView: View {
    @StateObject private var audioVisualizer = AudioVisualizer()
    
    @State private var audioIsFinished = true
    @State private var navigateToHome = false
    
    @State private var textOffset: CGFloat = UIScreen.main.bounds.height * 0.35
    
        private var colorOfEqualizer = Color.cyan
//        private var colorOfEqualizer = Color.indigo   // main
//    private var colorOfEqualizer = Color.indigo
    private var offsetDistanceOfEqualizer: CGFloat = -110
    private var shadowColorOfEqualizer = Color.white
    
    private var durationOfTextAnimation: CGFloat = 54
    
    private var customFont: CustomFont = .correctionBrush
    
    private var shape: Shape = .shape1
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.background)
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: UIScreen.main.bounds.height * 0.05) {
                    ZStack {
                        CircularEqualizerView(
                            amplitudes: audioVisualizer.amplitudes,
                            color: colorOfEqualizer,
                            shadowColor: shadowColorOfEqualizer,
                            offsetDistance: offsetDistanceOfEqualizer
                        )
                        
                        Rotating3DSphereView(iamegName: shape.rawValue)
                            .frame(width: 300, height: 300)
                    }
                    
                    OnboardingTextView(
                        textOffset: $textOffset,
                        customFont: .correctionBrush,
                        duration: durationOfTextAnimation
                    )
                    
                    if audioIsFinished {
                        NavigationLink(destination: HomeView()) {
                            NextButtonOnboardingView(
                                audioIsFinished: $audioIsFinished,
                                customFont: .correctionBrush
                            )
                            .frame(height: UIScreen.main.bounds.height * 0.05)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.8)
            }
//            .onAppear {
//                if let audioURL = Bundle.main.url(forResource: "CharlotteOnboarding", withExtension: ".mp3") {
//                    audioVisualizer.start()
//                    audioVisualizer.playAudio(url: audioURL) {
//                        withAnimation(.easeIn(duration: 1.5)) {
//                            audioIsFinished = true
//                        }
//                    }
//                }
//            }
            .onDisappear {
                audioVisualizer.stop()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    OnboardingView()
}
