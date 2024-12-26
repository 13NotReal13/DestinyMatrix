//
//  PreloadMatrixDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 10/12/2024.
//

import SwiftUI

struct PreloadMatrixDataView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigationManager: NavigationManager
    
    let matrix: ShortMatrixData
    
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @StateObject private var viewModel = PreloadMatrixViewModel()
    @State private var navigateToMatrix = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    Completed3DSphere()
                    
                    Spacer()
                    
                    PreloadMatrixContentView(
                        viewModel: viewModel,
                        navigateToMatrix: $navigateToMatrix
                    )
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    CustomNavigationTitleView(title: "Матрица Судьбы")
                }
            }
            .onAppear {
                viewModel.startLoading()
                
                if let audioURL = Bundle.main.url(forResource: "CharlottePreloadMatrixData", withExtension: "mp3") {
                    audioVisualizer.playAudio(url: audioURL) { }
                }
                
                FirebaseLogManager.shared.logScreenView(screenName: "preload_matrix")
            }
            .background(
                NavigationLink(
                    destination: MatrixView(
                        matrixData: MatrixCalculation(
                            name: matrix.name,
                            dateOfBirthday: matrix.dateOfBirthday
                        ).matrixData,
                        isFromPreload: true
                    )
                    .environmentObject(navigationManager),
                    isActive: $navigateToMatrix
                ) {
                    EmptyView()
                }
            )
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        PreloadMatrixDataView(matrix: ShortMatrixData(name: "Иван", dateOfBirthday: .now, dateCreationMatrix: .now))
            .environmentObject(AudioVisualizer())
    }
}
