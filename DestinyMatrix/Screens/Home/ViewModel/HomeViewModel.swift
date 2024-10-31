//
//  HomeViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import Foundation
import SwiftUI

enum CustomFont: String {
    case blackcraft = "Blackcraft"
    case correctionBrush = "CorrectionBrush"
    case inkverse = "Inkverse"
}

enum Shape: String {
    case shape1 = "Shape1"
    case shape2 = "Shape2"
    case shape3 = "Shape3"
    case shape4 = "Shape4"
    case shape5 = "Shape5"
    case shape6 = "Shape6"
    case shape7 = "Shape7"
    case shape8 = "Shape8"
    case shape9 = "Shape9"
}

final class HomeViewModel: ObservableObject {
    @Published var audioIsFinished = true
    @Published var onboardingIsFinished = true
    
    // MARK: - OnboardingText
    @Published var onboardingTextOffset: CGFloat = UIScreen.main.bounds.height * 0.35
    @Published var durationOfTextAnimation: CGFloat = 54
    
    // MARK: - Equalizer
    //    private var colorOfEqualizer = Color.indigo
    @Published var colorOfEqualizer = Color.cyan
    @Published var offsetDistanceOfEqualizer: CGFloat = -110
    @Published var shadowColorOfEqualizer = Color.white
    
    // MARK: - Font
    @Published var customFont: CustomFont = .correctionBrush
    
    // MARK: - Shape of 3D
    @Published var shape: String = Shape.shape9.rawValue
    
    func startOnboardingAudio(audioVisualizer: AudioVisualizer) {
        if !audioIsFinished, let audioURL = Bundle.main.url(forResource: "CharlotteOnboarding", withExtension: "mp3") {
            audioVisualizer.start()
            audioVisualizer.playAudio(url: audioURL) { [weak self] in
                DispatchQueue.main.async {
                    withAnimation(.easeIn(duration: 1.5)) {
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
