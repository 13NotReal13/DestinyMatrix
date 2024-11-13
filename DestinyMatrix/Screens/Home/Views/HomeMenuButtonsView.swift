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
    
    var body: some View {
        VStack {
            if !homeViewModel.readyToGoToEnterData {
                Spacer()
                
                Button {
                    withAnimation(.easeOut(duration: 0.2)) {
                        homeViewModel.readyToGoToEnterData = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeIn(duration: 0.7)) {
                            homeViewModel.currentScreen = .enterData
                        }
                    }
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
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}
//
//#Preview {
//    HomeMenuButtonsView(homeViewModel: HomeViewModel())
//}
