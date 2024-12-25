//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var isRootActive: Bool = false
}

struct HomeView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var navigationManager = NavigationManager()
    
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
                        
                        NavigationLink(
                            destination: EnterDataView()
                                .environmentObject(navigationManager),
                            isActive: $navigationManager.isRootActive
                        ) {
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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    homeViewModel.requestNotificationAuthorization()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}
