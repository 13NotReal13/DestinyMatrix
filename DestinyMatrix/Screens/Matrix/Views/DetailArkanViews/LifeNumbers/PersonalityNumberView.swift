//
//  PersonalityNumberView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct PersonalityNumberView: View {
    @State var personalityNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(personalityNumber.сategoryTitle)
                .font(.title)
            
            Text(personalityNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(personalityNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(personalityNumber.arkanInfo.positiveEnergyTitle)
                Text(personalityNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(personalityNumber.arkanInfo.negativeEnergyTitle)
                Text(personalityNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(personalityNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(personalityNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        PersonalityNumberView(
            personalityNumber: ArkanCategory(
                сategoryTitle: "Число Личности",
                arkanInfo: PersonalityNumberData.allArkans[3]!
            )
        )
    }
}
