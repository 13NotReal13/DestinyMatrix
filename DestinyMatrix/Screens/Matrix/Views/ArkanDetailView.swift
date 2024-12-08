//
//  ArkanDetailView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 11/11/2024.
//

import SwiftUI

struct ArkanDetailView: View {
    @State var destinyNumber: ArkanInfoNew
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(RelationshipsArkans.allArkans[1]!.title)
                .font(.title)
            
            ForEach(RelationshipsArkans.allArkans[1]!.subcategories, id: \.self) { subcategorie in
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
        
        ArkanDetailView(destinyNumber: DestinyNumberArkans.allArkans[1]!)
    }
}
