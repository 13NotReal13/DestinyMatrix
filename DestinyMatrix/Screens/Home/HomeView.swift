//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @StateObject private var viewModel = HomeViewModel()
    
    private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    VStack {
                        if viewModel.onboardingIsFinished {
                            Text("Матрица Судьбы")
                                .customText(fontSize: 36)
                        }
                    }
                    .frame(height: screenHeight * 0.05)
                    
                    ZStack {                        
                        Completed3DSphere(
                            amplitudes: audioVisualizer.amplitudes,
                            colorOfEqualizer: viewModel.colorOfEqualizer,
                            shadowColorOfEqualizer: viewModel.shadowColorOfEqualizer,
                            offsetDistanceOfEqualizer: viewModel.offsetDistanceOfEqualizer,
                            imageName: viewModel.shape
                        )
                        
                        VStack {
                            if viewModel.onboardingIsFinished {
                                DateAround3DSphere(customFont: viewModel.customFont)
                                Spacer()
                            }
                        }
                    }
                    .frame(height: screenHeight * 0.4)
                    
                    VStack {
                        if !viewModel.onboardingIsFinished {
                            VStack {
                                OnboardingTextView(
                                    textOffset: $viewModel.onboardingTextOffset,
                                    customFont: viewModel.customFont,
                                    duration: viewModel.durationOfTextAnimation
                                )
                            }
                            .frame(height: screenHeight * 0.35)
                            
                            VStack {
                                if viewModel.audioIsFinished {
                                    NextButtonOnboardingView(
                                        audioIsFinished: $viewModel.audioIsFinished,
                                        onboardingIsFinished: $viewModel.onboardingIsFinished,
                                        customFont: viewModel.customFont
                                    )
                                }
                            }
                            .frame(height: screenHeight * 0.05)
                        } else {
                            HomeMenuButtonsView()
                        }
                    }
                    .frame(height: screenHeight * 0.4)
                }
                .padding()
                .frame(height: screenHeight * 0.9)
                    
            }
            .onAppear {
//                viewModel.startOnboardingAudio(audioVisualizer: audioVisualizer)
            }
            .onDisappear {
                viewModel.stopAudio(audioVisualizer: audioVisualizer)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    HomeView()
        .environmentObject(AudioVisualizer())
}
