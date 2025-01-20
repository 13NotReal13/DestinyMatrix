//
//  BackgroundImageView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 20/01/2025.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Image("BackgroundPurchaseScreen")
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.4)
                    .ignoresSafeArea(edges: .horizontal)
                    .ignoresSafeArea(edges: .top)
                    .mask(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .black, location: 0.6),
                                .init(color: .clear, location: 1)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            
            Spacer()
        }
    }
}

#Preview {
    BackgroundImageView()
}
