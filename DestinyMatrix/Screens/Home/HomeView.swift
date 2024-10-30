//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var audioVisualizer = AudioVisualizer()
    
    @State private var audioIsFinished = true
    @State private var onboardingIsFinished = true
    
    @State private var onboardingTextOffset: CGFloat = UIScreen.main.bounds.height * 0.35
    
    private var colorOfEqualizer = Color.cyan
//    private var colorOfEqualizer = Color.indigo
    private var offsetDistanceOfEqualizer: CGFloat = -110
    private var shadowColorOfEqualizer = Color.white
    
    private var durationOfTextAnimation: CGFloat = 54
    
    private var customFont: CustomFont = .correctionBrush
    
    private var shape: Shape = .shape1
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    ZStack {
                        CircularEqualizerView(
                            amplitudes: audioVisualizer.amplitudes,
                            color: colorOfEqualizer,
                            shadowColor: shadowColorOfEqualizer,
                            offsetDistance: offsetDistanceOfEqualizer
                        )
                        
                        Rotating3DSphereView(iamegName: shape.rawValue)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                        
                        VStack {
                            if onboardingIsFinished {
                                TitleWithDatesView(customFont: .correctionBrush)
                                Spacer()
                            }
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    
                    VStack {
                        if !onboardingIsFinished {
                            VStack {
                                OnboardingTextView(
                                    textOffset: $onboardingTextOffset,
                                    customFont: .correctionBrush,
                                    duration: durationOfTextAnimation
                                )
                            }
                            .frame(height: UIScreen.main.bounds.height * 0.35)
                            
                            VStack {
                                if audioIsFinished {
                                    NextButtonOnboardingView(
                                        audioIsFinished: $audioIsFinished,
                                        onboardingIsFinished: $onboardingIsFinished,
                                        customFont: .correctionBrush
                                    )
                                }
                            }
                            .frame(height: UIScreen.main.bounds.height * 0.05)
                        } else {
                            VStack {
                                HStack() {
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "questionmark")
                                            .font(.system(size: 34))
                                            .foregroundStyle(.white)
                                            .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
                                            .padding()
                                            .background(
                                                LinearGradient(
                                                    colors: [.backgroundColor1, .buttonColor2],
                                                    startPoint: .bottom,
                                                    endPoint: .top
                                                )
                                            )
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.white, lineWidth: 2)
                                            )
                                            .clipShape(.circle)
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        Text("Рассчитать матрицу")
                                            .font(.custom(customFont.rawValue, size: 16))
                                            .foregroundStyle(.white)
                                            .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
                                            .padding()
                                            .background(
                                                LinearGradient(
                                                    colors: [.backgroundColor2, .buttonColor2],
                                                    startPoint: .bottom,
                                                    endPoint: .top
                                                )
                                            )
                                            .overlay(
                                                Capsule()
                                                    .stroke(Color.white, lineWidth: 2)
                                            )
                                            .clipShape(.capsule)
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "book.pages")
                                            .font(.system(size: 24))
                                            .foregroundStyle(.white)
                                            .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
                                            .padding()
                                            .background(
                                                LinearGradient(
                                                    colors: [.backgroundColor1, .buttonColor2],
                                                    startPoint: .bottom,
                                                    endPoint: .top
                                                )
                                            )
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.white, lineWidth: 2)
                                            )
                                            .clipShape(.circle)
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.4)
                }
                .padding()
                .frame(height: UIScreen.main.bounds.height * 0.9)
                    
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
    HomeView()
}
