//
//  KarmicKnotsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct KarmicKnotsView: View {
    @State var karmicKnotsNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(karmicKnotsNumber.сategoryTitle)
                .font(.title)
            
            Text(karmicKnotsNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(karmicKnotsNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(karmicKnotsNumber.arkanInfo.positiveEnergyTitle)
                Text(karmicKnotsNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(karmicKnotsNumber.arkanInfo.negativeEnergyTitle)
                Text(karmicKnotsNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(karmicKnotsNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(karmicKnotsNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        KarmicKnotsView(
            karmicKnotsNumber: ArkanCategory(
                сategoryTitle: "Кармические Узлы",
                arkanInfo: KarmicKnotsData.allArkans[4]!
            )
        )
    }
}
