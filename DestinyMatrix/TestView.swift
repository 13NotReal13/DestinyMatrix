//
//  TestView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/11/2024.
//

import SwiftUI

struct TestView: View {
    let data = DestinyNumberData()
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            ScrollView {
                VStack(spacing: 32) {
                    Text(DestinyNumberData.data.сategoryTitle)
                        .customText(fontSize: 24, textColor: .white)
                    
                    VStack(spacing: 16) {
                        Text(DestinyNumberData.data.arkanInfo[1]!.shortDescription)
                            .customText(fontSize: 15, textColor: .white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(DestinyNumberData.data.arkanInfo[1]!.mainDescription)
                            .customText(fontSize: 17, textColor: .white)
                    }
                    
                    VStack(spacing: 10) {
                        Text(DestinyNumberData.data.arkanInfo[1]!.positiveEnergyTitle)
                            .customText(fontSize: 15, textColor: .white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(DestinyNumberData.data.arkanInfo[1]!.positiveEnergyText)
                            .customText(fontSize: 17, textColor: .white)
                    }
                    
                    VStack(spacing: 10) {
                        Text(DestinyNumberData.data.arkanInfo[1]!.negativeEnergyTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(DestinyNumberData.data.arkanInfo[1]!.negativeEnergyText)
                            .font(.system(size: 17))
                    }
                    
                    VStack(spacing: 10) {
                        Text(DestinyNumberData.data.arkanInfo[1]!.adviceTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(DestinyNumberData.data.arkanInfo[1]!.adviceText)
                    }
                    
                    Text(RecommendationsData.data.arkanInfo[1]!.adviceText)
                }
                .padding()
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    TestView()
}
