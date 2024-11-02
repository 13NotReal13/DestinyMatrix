//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

enum Screen {
    case onboarding
    case home
    case enterData
}

struct HomeView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @StateObject private var homeViewModel = HomeViewModel()
    
    private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack {
                Completed3DSphere(
                    viewModel: homeViewModel,
                    amplitudes: audioVisualizer.amplitudes,
                    onboardingIsFinished: homeViewModel.onboardingIsFinished
                )
                
                if homeViewModel.currentScreen == .onboarding {
                    OnboardingView(
                        homeViewModel: homeViewModel,
                        audioVisualizer: audioVisualizer
                    )
                } else if homeViewModel.currentScreen == .home {
                    HomeMenuButtonsView(homeViewModel: homeViewModel, audioVisualizer: audioVisualizer)
                } else if homeViewModel.currentScreen == .enterData {
                    EnterDataView(
                        audioVisualizer: audioVisualizer,
                        homeViewModel: homeViewModel
                    )
                }
            }
            .padding()
            .frame(height: screenHeight * 0.9)
            
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AudioVisualizer())
}
