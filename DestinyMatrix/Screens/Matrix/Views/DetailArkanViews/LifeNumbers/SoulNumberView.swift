//
//  SoulNumberView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 11/11/2024.
//

import SwiftUI

struct SoulNumberView: View {
    @State var soulNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(soulNumber.сategoryTitle)
                .font(.title)
            
            Text(soulNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(soulNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(soulNumber.arkanInfo.positiveEnergyTitle)
                Text(soulNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(soulNumber.arkanInfo.negativeEnergyTitle)
                Text(soulNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(soulNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(soulNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        SoulNumberView(
            soulNumber: ArkanCategory(
                сategoryTitle: "Число Души",
                arkanInfo: SoulNumberData.allArkans[3]!
            )
        )
    }
}
