//
//  EnergyFlowsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct EnergyFlowsView: View {
    @State var energyFlowsNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(energyFlowsNumber.сategoryTitle)
                .font(.title)
            
            Text(energyFlowsNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(energyFlowsNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(energyFlowsNumber.arkanInfo.positiveEnergyTitle)
                Text(energyFlowsNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(energyFlowsNumber.arkanInfo.negativeEnergyTitle)
                Text(energyFlowsNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(energyFlowsNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(energyFlowsNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        EnergyFlowsView(
            energyFlowsNumber: ArkanCategory(
                сategoryTitle: "Энергетические Потоки и Зоны Роста",
                arkanInfo: EnergyFlowsData.allArkans[4]!
            )
        )
    }
}
