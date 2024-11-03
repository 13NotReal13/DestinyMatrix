//
//  NextButtonOnboardingView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 29/10/2024.
//

import SwiftUI

struct NextButtonOnboardingView: View {
    @StateObject var onboardingViewModel: OnboardingViewModel
    @StateObject var homeViewModel: HomeViewModel
    
    var body: some View {
        Button {
            withAnimation(.easeOut(duration: 0.2)) {
                onboardingViewModel.onboardingWasShowed = true
                }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeIn(duration: 0.7)) {
                    homeViewModel.currentScreen = .home
                }
            }
        } label: {
            Text("Далее")
                .font(.custom(CustomFont.fontName.rawValue, size: 24))
                .padding()
                .foregroundStyle(.white)
                .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
                .opacity(onboardingViewModel.audioIsFinished ? 1 : 0)
                .transition(.opacity.combined(with: .scale(scale: 0.5)))
        }
    }
}

#Preview {
    NextButtonOnboardingView(
        onboardingViewModel: OnboardingViewModel(),
        homeViewModel: HomeViewModel()
    )
}
