//
//  HomeMenuButtonsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct HomeMenuButtonsView: View {
    @State var sliderValue: Double = 0.5
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                
            } label: {
                Text("Рассчитать матрицу")
                    .customText(fontSize: 16, textColor: .white)
                    .customButtonStyle(color1: .backgroundColor2, color2: .buttonColor2, shape: .capsule)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "questionmark")
                        .customText(fontSize: 34, textColor: .white)
                        .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .circle)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "book.pages")
                        .customText(fontSize: 24, textColor: .white)
                        .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .circle)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeMenuButtonsView()
}
