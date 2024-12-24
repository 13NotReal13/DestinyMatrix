//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    Spacer()
                    
                    Completed3DSphere()
                    
                    Spacer()
                    
                    VStack(spacing: 16) {
                        Spacer()
                        Spacer()
                        
                        NavigationLink(destination: EnterDataView()) {
                            HomeMenuButtonView(title: "Рассчитать матрицу")
                        }
                        
                        NavigationLink(destination: HistoryView()) {
                            HomeMenuButtonView(title: "История")
                        }
                        
                        NavigationLink(destination: HelpInfoView()) {
                            HomeMenuButtonView(title: "Содержание")
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        CustomNavigationTitleView(title: "Матрица Судьбы")
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
        .environmentObject(AudioVisualizer())
        .environmentObject(HomeViewModel(storageManager: StorageManager()))
}
