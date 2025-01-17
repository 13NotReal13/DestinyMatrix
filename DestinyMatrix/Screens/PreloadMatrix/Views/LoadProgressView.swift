//
//  LoadProgressView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct LoadProgressView: View {
    @ObservedObject var viewModel: PreloadMatrixViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Text(viewModel.statusText)
                .customText(fontSize: 16, textColor: .white)
            
            ProgressView(value: viewModel.progress, total: 1.0)
                .tint(.cyan)
        }
        .padding(.horizontal, 32)
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}
