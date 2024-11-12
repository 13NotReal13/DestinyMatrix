//
//  ProfessionsAndRolesView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct ProfessionsAndRolesView: View {
    @State var professionsAndRolesNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(professionsAndRolesNumber.сategoryTitle)
                .font(.title)
            
            Text(professionsAndRolesNumber.arkanInfo.shortDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(professionsAndRolesNumber.arkanInfo.mainDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(professionsAndRolesNumber.arkanInfo.positiveEnergyTitle)
                Text(professionsAndRolesNumber.arkanInfo.positiveEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(professionsAndRolesNumber.arkanInfo.negativeEnergyTitle)
                Text(professionsAndRolesNumber.arkanInfo.negativeEnergyText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(spacing: 8) {
                Text(professionsAndRolesNumber.arkanInfo.adviceTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(professionsAndRolesNumber.arkanInfo.adviceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        ProfessionsAndRolesView(
            professionsAndRolesNumber: ArkanCategory(
                сategoryTitle: "Подходящие Профессии и Жизненные Роли",
                arkanInfo: ProfessionsAndRolesData.allArkans[4]!
            )
        )
    }
}
