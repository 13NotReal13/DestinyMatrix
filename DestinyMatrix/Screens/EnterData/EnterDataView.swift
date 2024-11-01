//
//  EnterDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct EnterDataView: View {
    @StateObject private var viewModel = EnterDataViewModel()
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack(spacing: 20) {
                Spacer()
                
                NameTextFieldView(viewModel: viewModel)
                
                DatePickerView(viewModel: viewModel)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Далее")
                        .padding(.horizontal)
                        .customText(fontSize: 16, textColor: .white)
                        .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    EnterDataView()
}
