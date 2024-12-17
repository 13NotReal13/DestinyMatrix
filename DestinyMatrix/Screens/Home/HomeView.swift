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
    case preloadMatrixData
}

struct HomeView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    Completed3DSphere()
                    // Onboarding
                    if homeViewModel.currentScreen == .onboarding {
                        OnboardingView()
                            .onAppear {
                                homeViewModel.startOnboardingAudio(audioVisualizer: audioVisualizer)
                            }
                        // Home
                    } else if homeViewModel.currentScreen == .home {
                        HomeMenuButtonsView()
                            .onAppear {
//                                if !homeViewModel.backgroundAudioIsPlaying {
//                                    audioVisualizer.playBackgroundAudio()
//                                }
//                                homeViewModel.backgroundAudioIsPlaying = true
                            }
                        // EnterData
                    } else if homeViewModel.currentScreen == .enterData {
                        EnterDataView()
                        // PreloadMatrix
                    } else if homeViewModel.currentScreen == .preloadMatrixData {
                        PreloadMatrixDataView()
                            .onAppear {
                                homeViewModel.startPreloadAudio(audioVisualizer: audioVisualizer)
                            }
                            .onDisappear {
                                homeViewModel.stopPreloadAudio(audioVisualizer: audioVisualizer)
                            }
                    }
                }
                .padding()
                .frame(height: screenHeight * 0.8)
            }
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $homeViewModel.showHelpInfoView) {
                HelpInfoView()
            }
            .fullScreenCover(isPresented: $homeViewModel.showHistoryView) {
                HistoryView()
            }
            .fullScreenCover(
                isPresented: $homeViewModel.showMatrixView,
                onDismiss: homeViewModel.goHomeScreen) {
                    MatrixView(
                        matrixData: MatrixCalculation(
                            name: homeViewModel.name,
                            dateOfBirthday: homeViewModel.dateBirthday
                        )
                        .matrixData
                    )
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack(spacing: 8) {
                            if homeViewModel.currentScreen != .onboarding {
                                Text("Матрица Судьбы")
                                    .customText(fontSize: 28, textColor: .white)
                                
                                Text("Ваш путь к успеху и изобилию")
                                    .customText(fontSize: 12, textColor: .white)
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        if homeViewModel.currentScreen != .home
                            && homeViewModel.currentScreen != .onboarding
                            && homeViewModel.currentScreen != .preloadMatrixData {
                            Button {
                                homeViewModel.goHomeScreen()
                            } label: {
                                Image(systemName: "chevron.backward")
                                    .customText(fontSize: 17, textColor: .white)
                                    .customBarButtonStyle(shape: .circle)
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AudioVisualizer())
        .environmentObject(HomeViewModel())
}
