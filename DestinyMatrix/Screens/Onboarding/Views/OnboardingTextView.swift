//
//  OnboardingTextView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 29/10/2024.
//

import SwiftUI

struct OnboardingTextView: View {
    @Binding var textOffset: CGFloat
    
    var customFont: CustomFont
    var duration: CGFloat
    
    var body: some View {
        ScrollView {
            Text(OnboardingTextModel.introductionText)
                .font(.custom(customFont.rawValue, size: 24))
                .foregroundColor(.white)
                .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .offset(y: textOffset)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                .onAppear {
                    withAnimation(Animation.linear(duration: duration)) {
                        textOffset = -UIScreen.main.bounds.height
                    }
                }
        }
        .frame(height: 300)
        .mask(
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .clear, location: 0),
                    .init(color: .white, location: 0.1),
                    .init(color: .white, location: 0.9),
                    .init(color: .clear, location: 1)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

//#Preview {
//    OnboardingTextView()
//}
