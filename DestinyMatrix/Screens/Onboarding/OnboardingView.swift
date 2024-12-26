//
//  OnboardingTextView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 29/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer

    @State private var navigateToHome = false
    @State private var onboardingAudioIsFinished = false
    @State private var textOffset: CGFloat = UIScreen.main.bounds.height * 0.5
    
    private var duration: CGFloat = 100
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    Spacer()
                    
                    Completed3DSphere()
                    
                    ScrollView {
                        VStack {
                            Text(OnboardingTextModel.introductionText)
                                .customText(fontSize: 17, textColor: .white)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineSpacing(4)
                                .offset(y: textOffset)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                                .onAppear {
                                    withAnimation(Animation.linear(duration: duration)) {
                                        textOffset = -UIScreen.main.bounds.height
                                    }
                                }
                        }
                    }
                    .disabled(true)
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
                VStack {
                    Spacer()
                    
                    NextButtonOnboardingView(
                        onboardingAudioIsFinished: $onboardingAudioIsFinished,
                        navigateToHome: $navigateToHome
                    )
                }
                
                NavigationLink(
                    destination: HomeView()
                        .environmentObject(audioVisualizer),
                    isActive: $navigateToHome
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .onAppear {
                if let audioURL = Bundle.main.url(forResource: "CharlotteOnboarding", withExtension: "mp3") {
                    audioVisualizer.playAudio(url: audioURL) {
                        self.onboardingAudioIsFinished = true
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
        OnboardingView()
            .environmentObject(AudioVisualizer())
}
