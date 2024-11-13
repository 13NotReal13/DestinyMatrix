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

//struct PreloadKeyboardView: UIViewRepresentable {
//    func makeUIView(context: Context) -> UITextField {
//        let textField = UITextField()
//        textField.isHidden = true // Скрываем текстовое поле от пользователя
//        UIApplication.shared.windows.first?.addSubview(textField) // Добавляем на главное окно
//        textField.becomeFirstResponder() // Делаем его первым респондентом, вызывая клавиатуру
//        
//        // Закрываем клавиатуру после короткой задержки
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            textField.resignFirstResponder() // Скрываем клавиатуру
//            textField.removeFromSuperview() // Удаляем временное поле
//        }
//        
//        return textField
//    }
//
//    func updateUIView(_ uiView: UITextField, context: Context) {}
//}

struct HomeView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @StateObject private var homeViewModel = HomeViewModel()
    
    private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
                VStack {
//                    PreloadKeyboardView()
                    
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
                        HomeMenuButtonsView(homeViewModel: homeViewModel)
                            .onAppear {
                                audioVisualizer.playBackgroundAudio() 
                            }
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
