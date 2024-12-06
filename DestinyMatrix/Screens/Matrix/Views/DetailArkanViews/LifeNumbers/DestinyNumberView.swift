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
        VStack(alignment: .leading, spacing: 16) {
            Text(DestinyNumberArkans.allArkans[22]!.title)
                .font(.title)
            
            ForEach(DestinyNumberArkans.allArkans[22]!.subcategories, id: \.self) { subcategorie in
                Text(subcategorie.title)
                    .font(.title2)
                    .padding(.top)
                Text(subcategorie.shortDescription)
                    .opacity(0.7)
                Text(subcategorie.mainDescription)
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
