//
//  ShadowBackgroundView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 16/01/2025.
//

import SwiftUI

struct ShadowBackgroundView: View {
    var body: some View {
        LinearGradient(
            stops: [
                .init(color: .black.opacity(0.9), location: 0),
                .init(color: .clear, location: 0.5)
            ],
            startPoint: .bottom,
            endPoint: .top
        )
        .ignoresSafeArea()
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        ShadowBackgroundView()
    }
}
