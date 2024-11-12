//
//  LifePathNumberView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 11/11/2024.
//

import SwiftUI

struct LifePathNumberView: View {
    @State var lifePathNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(lifePathNumber.сategoryTitle)
                .font(.title)
            
            Text(lifePathNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(lifePathNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(lifePathNumber.arkanInfo.positiveEnergyTitle)
                Text(lifePathNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(lifePathNumber.arkanInfo.negativeEnergyTitle)
                Text(lifePathNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(lifePathNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(lifePathNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        LifePathNumberView(
            lifePathNumber: ArkanCategory(
                сategoryTitle: "Число Жизненного Пути",
                arkanInfo: LifePathNumberData.allArkans[3]!
            )
        )
    }
}
