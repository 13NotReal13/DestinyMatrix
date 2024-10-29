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
    
    //    private var colorOfEqualizer = Color.cyan
    //    private var colorOfEqualizer = Color.indigo   // main
    private var colorOfEqualizer = Color.indigo
    private var offsetDistanceOfEqualizer: CGFloat = -110
    private var shadowColorOfEqualizer = Color.white
    
    private var customFont: CustomFont = .correctionBrush
    
    private var shape: Shape = .shape1
    
    var body: some View {
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
                
                ScrollView {
                    Text(OnboardingTextModel.introductionText)
                        .font(.custom(customFont.rawValue, size: 24))
                        .foregroundColor(.white)
                        .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .offset(y: textOffset)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 54)) {
                                textOffset = -UIScreen.main.bounds.height
                            }
                        }
                }
                .frame(height: 300)
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .white, location: 0.1),
                            .init(color: .white, location: 0.9),
                            .init(color: .clear, location: 1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .frame(height: UIScreen.main.bounds.height * 0.8)
            
            Spacer()
            
            if audioIsFinished {
                NextButtonOnboardingView(
                    navigateToHome: $navigateToHome,
                    audioIsFinished: $audioIsFinished,
                    customFont: .correctionBrush
                )
            }
            
        }
        //        .onAppear {
        //            if let audioURL = Bundle.main.url(forResource: "CharlotteOnboarding", withExtension: ".mp3") {
//                audioVisualizer.start()
//                audioVisualizer.playAudio(url: audioURL) {
//                    withAnimation(.easeIn(duration: 1.5)) {
//                        audioIsFinished = true
//                    }
//                }
//            }
//        }
        .onDisappear {
            audioVisualizer.stop()
        }
        .fullScreenCover(isPresented: $navigateToHome) {
            HomeView()
                .transition(.opacity.animation(.easeInOut(duration: 1.5)))
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
}

#Preview {
    OnboardingView()
}
