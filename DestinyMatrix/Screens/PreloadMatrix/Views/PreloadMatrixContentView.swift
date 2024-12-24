//
//  PreloadMatrixContentView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct PreloadMatrixContentView: View {
    @ObservedObject var viewModel: PreloadMatrixViewModel
    @Binding var navigateToMatrix: Bool
    
    var body: some View {
        VStack {
            if viewModel.showButton {
                VStack {
                    Spacer()
                    
                    Button {
                        navigateToMatrix = true
                    } label: {
                        Text("Открыть")
                            .frame(width: UIScreen.main.bounds.width * 0.6)
                            .customText(fontSize: 16, textColor: .white)
                            .customButtonStyle(shape: .capsule)
                    }
                }
                .transition(.opacity.animation(.easeIn(duration: 0.05)))
            } else {
                VStack(spacing: 16) {
                    Spacer()
                    
                    Text(viewModel.statusText)
                        .customText(fontSize: 16, textColor: .white)
                    
                    ProgressView(value: viewModel.progress, total: 1.0)
                        .tint(.buttonColor2)
                }
                .padding(.horizontal, 32)
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}
