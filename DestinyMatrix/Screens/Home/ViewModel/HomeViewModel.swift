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
}

final class HomeViewModel: ObservableObject {
    @Published private var audioIsFinished = true
    @Published private var onboardingIsFinished = true
    
    // MARK: - OnboardingText
    @Published private var onboardingTextOffset: CGFloat = UIScreen.main.bounds.height * 0.35
    @Published private var durationOfTextAnimation: CGFloat = 54
    
    // MARK: - Equalizer
    //    private var colorOfEqualizer = Color.indigo
    @Published private var colorOfEqualizer = Color.cyan
    @Published private var offsetDistanceOfEqualizer: CGFloat = -110
    @Published private var shadowColorOfEqualizer = Color.white
    
    // MARK: - Font
    @Published private var customFont: CustomFont = .correctionBrush
    
    // MARK: - Shape of 3D
    @Published private var shape: Shape = .shape1
    
    private var audioVisualizer = AudioVisualizer()
}
