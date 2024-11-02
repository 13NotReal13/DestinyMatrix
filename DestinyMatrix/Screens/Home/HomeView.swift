//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI
import Combine

enum Screen {
    case onboarding
    case home
    case enterData
}

struct HomeView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var keyboardHeight: CGFloat = 0
    @State private var isKeyboardShown: Bool = false
    @State private var keyboardPublisher: AnyCancellable?
    
    private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Completed3DSphere(
                        homeViewModel: homeViewModel,
                        audioVusualizer: audioVisualizer,
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
                .padding(.bottom, keyboardHeight + 300)
                .animation(.easeOut(duration: isKeyboardShown ? 0.3 : 0.6), value: keyboardHeight)
            }
            .frame(height: screenHeight * 0.9)
//            .scrollDisabled(true)
            .onAppear {
                setupKeyboardObservers() // Подписка на события клавиатуры
            }
            .onDisappear {
                keyboardPublisher?.cancel() // Отписка от событий клавиатуры
            }
        }
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.keyboardHeight = keyboardFrame.height == UIScreen.main.bounds.height ? 0 : keyboardFrame.height
                self.isKeyboardShown = true
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AudioVisualizer())
}
