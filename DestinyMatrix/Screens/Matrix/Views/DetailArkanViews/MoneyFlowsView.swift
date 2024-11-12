//
//  MoneyFlowsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct MoneyFlowsView: View {
    @State var moneyFlowsNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(moneyFlowsNumber.сategoryTitle)
                .font(.title)
            
            Text(moneyFlowsNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(moneyFlowsNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(moneyFlowsNumber.arkanInfo.positiveEnergyTitle)
                Text(moneyFlowsNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(moneyFlowsNumber.arkanInfo.negativeEnergyTitle)
                Text(moneyFlowsNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(moneyFlowsNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(moneyFlowsNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        MoneyFlowsView(
            moneyFlowsNumber: ArkanCategory(
                сategoryTitle: "Денежный Поток",
                arkanInfo: MoneyFlowsData.allArkans[4]!
            )
        )
    }
}
