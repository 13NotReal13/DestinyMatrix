//
//  TitleWithDatesView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import SwiftUI

struct TitleWithDatesView: View {
    var customFont: CustomFont
    
    var body: some View {
        VStack {
            Text("Матрица Судьбы")
                .font(.custom(customFont.rawValue, size: 36))
                .foregroundStyle(.white)
                .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
            
            HStack {
                Text("30")
                    .font(.custom(customFont.rawValue, size: 40))
                    .foregroundStyle(.white)
                    .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
                
                Spacer()
                
                Text("10")
                    .font(.custom(customFont.rawValue, size: 40))
                    .foregroundStyle(.white)
                    .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
            }
            .padding(UIScreen.main.bounds.width * 0.05)
//            .opacity(audioIsFinished ? 1 : 0)
//            .transition(.opacity.combined(with: .scale(scale: 0.5)))
        }
    }
}

#Preview {
    TitleWithDatesView(customFont: CustomFont.correctionBrush)
}
