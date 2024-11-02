//
//  OnboardingViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import Foundation
import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var audioIsFinished: Bool = false
    @Published var onboardingWasShowed: Bool = false
    
    func startOnboardingAudio(audioVisualizer: AudioVisualizer) {
        if !audioIsFinished, let audioURL = Bundle.main.url(forResource: "CharlotteOnboarding", withExtension: "mp3") {
            audioVisualizer.playAudio(url: audioURL) { [weak self] in
                DispatchQueue.main.async {
                    withAnimation(.easeIn(duration: 1)) {
                        self?.audioIsFinished = true
                    }
                }
            }
        }
    }
    
    func stopAudio(audioVisualizer: AudioVisualizer) {
        audioVisualizer.stop()
    }
}
