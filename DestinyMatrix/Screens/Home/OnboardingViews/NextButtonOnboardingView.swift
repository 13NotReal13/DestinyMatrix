//
//  NextButtonOnboardingView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 29/10/2024.
//

import SwiftUI

struct NextButtonOnboardingView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        Button {
            withAnimation(.easeOut(duration: 0.2)) {
                homeViewModel.onboardingWasShowed = true
                }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeIn(duration: 0.7)) {
                    homeViewModel.currentScreen = .home
                }
            }
        } label: {
            Text("Далее")
                .frame(maxWidth: .infinity)
                .customText(fontSize: 17, textColor: .white)
                .customButtonStyle(shape: .capsule)
                .opacity(homeViewModel.onboardingAudioIsFinished ? 1 : 0)
                .transition(.opacity.combined(with: .scale(scale: 0.5)))
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        NextButtonOnboardingView()
            .environmentObject(HomeViewModel())
    }
}
