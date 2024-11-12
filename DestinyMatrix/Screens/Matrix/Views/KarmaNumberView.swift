//
//  KarmaNumberView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct KarmaNumberView: View {
    @State var karmaNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(karmaNumber.сategoryTitle)
                .font(.title)

            Text(karmaNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
                Text(karmaNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(karmaNumber.arkanInfo.positiveEnergyTitle)
                Text(karmaNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(karmaNumber.arkanInfo.negativeEnergyTitle)
                Text(karmaNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(karmaNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(karmaNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        KarmaNumberView(
            karmaNumber: ArkanCategory(
                сategoryTitle: "Число Кармы",
                arkanInfo: KarmaNumberData.allArkans[3]!
            )
        )
    }
}
