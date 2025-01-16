//
//  NextButtonOnboardingView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 29/10/2024.
//

import SwiftUI

struct NextButtonOnboardingView: View {
    @Binding var onboardingAudioIsFinished: Bool
    @Binding var navigateToHome: Bool
    
    @AppStorage("onboardingWasShowing") private var onboardingWasShowing = false
    
    var body: some View {
        Button {
            onboardingWasShowing = true
            navigateToHome = true
        } label: {
            Text("Далее")
                .frame(width: UIScreen.main.bounds.width * 0.2)
                .customText(fontSize: 17, textColor: .white)
                .customButtonStyle(shape: .capsule)
                .opacity(onboardingAudioIsFinished ? 1 : 0)
                .transition(.opacity.combined(with: .scale(scale: 0.1)))
        }
    }
}
