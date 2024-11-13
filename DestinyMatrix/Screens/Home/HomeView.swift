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
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
                VStack {
                    Completed3DSphere()
                    
                    if homeViewModel.currentScreen == .onboarding {
                        OnboardingView()
                    } else if homeViewModel.currentScreen == .home {
                        HomeMenuButtonsView()
                            .onAppear {
                                audioVisualizer.playBackgroundAudio()
                            }
                    } else if homeViewModel.currentScreen == .enterData {
                        EnterDataView()
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
