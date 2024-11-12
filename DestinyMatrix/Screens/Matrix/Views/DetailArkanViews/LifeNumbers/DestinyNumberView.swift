//
//  DestinyNumberView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 11/11/2024.
//

import SwiftUI

struct DestinyNumberView: View {
    @State var destinyNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(destinyNumber.сategoryTitle)
                .font(.title)
            
            Text(destinyNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(destinyNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(destinyNumber.arkanInfo.positiveEnergyTitle)
                Text(destinyNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(destinyNumber.arkanInfo.negativeEnergyTitle)
                Text(destinyNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(destinyNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(destinyNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        DestinyNumberView(
            destinyNumber: ArkanCategory(
                сategoryTitle: "Число Судьбы",
                arkanInfo: DestinyNumberData.allArkans[4]!
            )
        )
    }
}
