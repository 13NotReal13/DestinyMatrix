//
//  EnterDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct EnterDataView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    @State private var readyToGoToPreloadMatrixData = false
    
    var body: some View {
        VStack(spacing: 20) {
            if !readyToGoToPreloadMatrixData {
                Spacer()
                
                NameTextFieldView()
                
                DatePickerView()
                
                Spacer()
                
                Button {
                    homeViewModel.validateName()
                    homeViewModel.validateDate()
                    
                    if homeViewModel.isNameValid && homeViewModel.isDateValid {
                        StorageManager().add(
                            shortMatrixData: ShortMatrixData(
                                name: homeViewModel.name,
                                dateOfBirthday: homeViewModel.dateBirthday,
                                dateCreationMatrix: .now
                            )
                        )
                        
                        withAnimation(.easeOut(duration: 0.2)) {
                            readyToGoToPreloadMatrixData = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeIn(duration: 0.7)) {
                                homeViewModel.currentScreen = .preloadMatrixData
                            }
                        }
                    }
                } label: {
                    Text("Далее")
                        .frame(maxWidth: .infinity)
                        .customText(fontSize: 16, textColor: .white)
                        .customButtonStyle(shape: .capsule)
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
            .environmentObject(AudioVisualizer())
            .environmentObject(HomeViewModel())
    }
}
