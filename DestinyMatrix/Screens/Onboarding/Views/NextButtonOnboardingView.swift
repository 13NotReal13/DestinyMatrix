//
//  NextButtonOnboardingView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 29/10/2024.
//

import SwiftUI

struct NextButtonOnboardingView: View {
    @Binding var audioIsFinished: Bool
    
    var customFont: CustomFont
    
    var body: some View {
        Text("Далее")
            .font(.custom(customFont.rawValue, size: 24))
            .padding()
            .foregroundStyle(.white)
            .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
            .opacity(audioIsFinished ? 1 : 0)
            .transition(.opacity.combined(with: .scale(scale: 0.5)))
    }
}

#Preview {
    NextButtonOnboardingView(
        audioIsFinished: .constant(true),
        customFont: CustomFont.correctionBrush
    )
}
