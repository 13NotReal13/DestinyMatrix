//
//  ResourcesAndTalentsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct ResourcesAndTalentsView: View {
    @State var resourcesAndTalentsNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(resourcesAndTalentsNumber.сategoryTitle)
                .font(.title)
            
            Text(resourcesAndTalentsNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(resourcesAndTalentsNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(resourcesAndTalentsNumber.arkanInfo.positiveEnergyTitle)
                Text(resourcesAndTalentsNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(resourcesAndTalentsNumber.arkanInfo.negativeEnergyTitle)
                Text(resourcesAndTalentsNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(resourcesAndTalentsNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(resourcesAndTalentsNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        ResourcesAndTalentsView(
            resourcesAndTalentsNumber: ArkanCategory(
                сategoryTitle: "Ресурсы и Таланты",
                arkanInfo: ResourcesAndTalentsData.allArkans[4]!
            )
        )
    }
}
