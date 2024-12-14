//
//  EnterDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct EnterDataView: View {
    @EnvironmentObject private var enterDataViewModel: EnterDataViewModel
    
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            if !homeViewModel.readyToGoToPreloadMatrixData {
                Spacer()
                
                NameTextFieldView()
                
                DatePickerView()
                
                Spacer()
                
                Button {
                    enterDataViewModel.validateName()
                    enterDataViewModel.validateDate()
                    
                    if enterDataViewModel.isNameValid && enterDataViewModel.isDateValid {
                        withAnimation(.easeOut(duration: 0.2)) {
                            homeViewModel.readyToGoToPreloadMatrixData = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeIn(duration: 0.7)) {
                                homeViewModel.currentScreen = .preloadMatrixData
                            }
                        }
                    }
                } label: {
                    Text("Далее")
                        .padding(.horizontal)
                        .customText(fontSize: 16, textColor: .white)
                        .customButtonStyle(color1: .backgroundColor2, color2: .buttonColor2, shape: .capsule)
                }
                
                Spacer()
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        EnterDataView()
            .environmentObject(EnterDataViewModel())
            .environmentObject(AudioVisualizer())
            .environmentObject(HomeViewModel())
    }
}
