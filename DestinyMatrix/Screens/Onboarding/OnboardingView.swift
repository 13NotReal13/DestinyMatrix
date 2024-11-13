//
//  OnboardingTextView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 29/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var onboardingViewModel: OnboardingViewModel
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    
    @State private var textOffset: CGFloat = UIScreen.main.bounds.height * 0.3
    
    private var duration: CGFloat = 54
    
    var body: some View {
        VStack {
            if !onboardingViewModel.onboardingWasShowed {
                VStack {
                    
                }
                .frame(height: UIScreen.main.bounds.height * 0.05)
                
                ScrollView {
                    VStack {
                        Text(OnboardingTextModel.introductionText)
                            .customText(fontSize: 24, textColor: .white)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                            .offset(y: textOffset)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
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
                
                VStack {
                    if onboardingViewModel.audioIsFinished {
                        NextButtonOnboardingView()
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.05)
            }
        }
        .onAppear {
            onboardingViewModel.startOnboardingAudio(audioVisualizer: audioVisualizer)
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}

#Preview {
    OnboardingView()
        .environmentObject(OnboardingViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(AudioVisualizer())
}
