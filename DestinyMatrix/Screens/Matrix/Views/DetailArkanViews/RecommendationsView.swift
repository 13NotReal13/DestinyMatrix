//
//  RecommendationsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct RecommendationsView: View {
    @State var recommendationsNumber: ArkanCategory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(recommendationsNumber.сategoryTitle)
                .font(.title)
            
            Text(recommendationsNumber.arkanInfo.adviceText)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        RecommendationsView(
            recommendationsNumber: ArkanCategory(
                сategoryTitle: "Рекомендации",
                arkanInfo: RecommendationsData.allArkans[4]!
            )
        )
    }
}
