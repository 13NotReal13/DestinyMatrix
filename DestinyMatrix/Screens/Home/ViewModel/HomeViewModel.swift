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
    case fontName = "CorrectionBrush" // main
    case inkverse = "Inkverse"
}

enum ShapeOfSphere: String {
    case shapeName = "Shape9" // main
    case shape10 = "Shape10"
    case shape11 = "Shape11"
}

final class HomeViewModel: ObservableObject {
    @Published var currentScreen: Screen = .onboarding
    @Published var onboardingIsFinished = false
    @Published var readyToGoToEnterData = false
    @Published var readyToGoToPreloadMatrixData = false
    
    @Published var showHelpInfoView: Bool = false
}
