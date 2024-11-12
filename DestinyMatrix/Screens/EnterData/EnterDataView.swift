//
//  EnterDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct EnterDataView: View {
    @StateObject var audioVisualizer: AudioVisualizer
    @StateObject var homeViewModel: HomeViewModel
    
    @StateObject private var enterDataViewModel = EnterDataViewModel()
    
    @State private var showMatrixView: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            if enterDataViewModel.audioEnterDataIsFinished {
                Spacer()
                
                NameTextFieldView(enterDataViewModel: enterDataViewModel)
                
                DatePickerView(enterDataViewModel: enterDataViewModel)
                
                Spacer()
                
                Button {
                    enterDataViewModel.validateName()
                    enterDataViewModel.validateDate()
                    
                    if enterDataViewModel.isNameValid && enterDataViewModel.isDateValid {
                        showMatrixView = true
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
        .onAppear {
            enterDataViewModel.startEnterDataAudio(audioVisualizer: audioVisualizer)
        }
        .onDisappear {
            enterDataViewModel.stopAudio(audioVisualizer: audioVisualizer)
        }
        .fullScreenCover(isPresented: $showMatrixView) {
            MatrixView(
                matrixData: MatrixCalculation(
                    name: enterDataViewModel.name,
                    dateOfBirthday: enterDataViewModel.dateBirthday
                )
                .matrixData
            )
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        EnterDataView(
            audioVisualizer: AudioVisualizer(),
            homeViewModel: HomeViewModel()
        )
    }
}
