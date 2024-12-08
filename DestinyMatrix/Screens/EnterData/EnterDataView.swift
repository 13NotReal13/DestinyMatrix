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
    
    @State private var showMatrixView: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            NameTextFieldView()
            
            DatePickerView()
            
            Spacer()
            
            Button {
                enterDataViewModel.validateName()
                enterDataViewModel.validateDate()
                
                if enterDataViewModel.isNameValid && enterDataViewModel.isDateValid {
                    showMatrixView = true
                    enterDataViewModel.stopAudio(audioVisualizer: audioVisualizer)
                }
            } label: {
                Text("Далее")
                    .padding(.horizontal)
                    .customText(fontSize: 16, textColor: .white)
                    .customButtonStyle(color1: .backgroundColor2, color2: .buttonColor2, shape: .capsule)
            }
            
            Spacer()
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
        .onAppear {
            enterDataViewModel.startEnterDataAudio(audioVisualizer: audioVisualizer)
        }
        .onDisappear {
            enterDataViewModel.stopAudio(audioVisualizer: audioVisualizer)
        }
        .fullScreenCover(isPresented: $showMatrixView) {
            MatrixView(
                matrixData: MatrixCalculationNew(
                    name: enterDataViewModel.name,
                    dateOfBirthday: enterDataViewModel.dateBirthday,
                    dateCreationMatrix: .now
                )
                .matrixDataNew
            )
        }
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
