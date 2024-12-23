//
//  HomeMenuButtonsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct HomeMenuButtonsView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    @State private var sliderValue: Double = 0.5
    @State private var readyToGoToEnterData = false
    
    var body: some View {
        VStack(spacing: 16) {
            if !readyToGoToEnterData {
                Spacer()
                
                Button {
                    withAnimation(.easeOut(duration: 0.05)) {
                        readyToGoToEnterData = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        withAnimation(.easeIn(duration: 0.05)) {
                            homeViewModel.currentScreen = .enterData
                        }
                    }
                } label: {
                    Text("Рассчитать матрицу")
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .customText(fontSize: 17, textColor: .white)
                        .customButtonStyle(shape: .capsule)
                }
                
                Button {
                    homeViewModel.showHistoryView = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        homeViewModel.currentScreen = .history
                    }
                } label: {
                    Text("История")
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .customText(fontSize: 17, textColor: .white)
                        .customButtonStyle(shape: .capsule)
                }
                
                Button {
                    homeViewModel.showHelpInfoView = true
                
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        homeViewModel.currentScreen = .helpInfo
                    }
                } label: {
                    Text("Содержание")
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .customText(fontSize: 17, textColor: .white)
                        .customButtonStyle(shape: .capsule)
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        HomeMenuButtonsView()
            .environmentObject(HomeViewModel(storageManager: StorageManager()))
    }
}
