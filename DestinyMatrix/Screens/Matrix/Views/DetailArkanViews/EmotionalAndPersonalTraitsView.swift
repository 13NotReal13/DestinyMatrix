//
//  EmotionalAndPersonalTraitsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct EmotionalAndPersonalTraitsView: View {
    @State var emotionalAndPersonalTraitsNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(emotionalAndPersonalTraitsNumber.сategoryTitle)
                .font(.title)
            
            Text(emotionalAndPersonalTraitsNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(emotionalAndPersonalTraitsNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(emotionalAndPersonalTraitsNumber.arkanInfo.positiveEnergyTitle)
                Text(emotionalAndPersonalTraitsNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(emotionalAndPersonalTraitsNumber.arkanInfo.negativeEnergyTitle)
                Text(emotionalAndPersonalTraitsNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(emotionalAndPersonalTraitsNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(emotionalAndPersonalTraitsNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        EmotionalAndPersonalTraitsView(
            emotionalAndPersonalTraitsNumber: ArkanCategory(
                сategoryTitle: "Эмоциональные и Личные Качества",
                arkanInfo: EmotionalAndPersonalTraitsData.allArkans[4]!
            )
        )
    }
}
