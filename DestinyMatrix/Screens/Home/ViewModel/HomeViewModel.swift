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

enum Screen {
    case onboarding
    case home
    case enterData
    case preloadMatrixData
    case matrix
    case history
    case helpInfo
}

final class HomeViewModel: ObservableObject {
    private var storageManager: StorageManager
    
    @Published var currentScreen: Screen = .onboarding
    
    @Published var onboardingAudioIsFinished: Bool = false
    @Published var onboardingIsFinished = false
    @Published var onboardingWasShowed: Bool = false
    
    @Published var showHelpInfoView: Bool = false
    @Published var showHistoryView: Bool = false
    @Published var showMatrixView: Bool = false
    
    @Published var name: String = ""
    @Published var isNameValid: Bool = true
    
    @Published var dateBirthday: Date = Date()
    @Published var isDateValid: Bool = true
    
    @Published var displayedDateText: String = "Выбрать дату"
    @Published var isDatePickerPresented: Bool = false
    
    @Published var preloadAudioIsFinished: Bool = false
    @Published var matrixData: MatrixData?
    
    @Published var backgroundAudioIsPlaying = false
    
    init(storageManager: StorageManager) {
        self.storageManager = storageManager
        initializeFromStorage()
    }
    
    func initializeFromStorage() {
        if storageManager.onboardingWasShowing {
            onboardingAudioIsFinished = true
            onboardingIsFinished = true
            onboardingWasShowed = true
            currentScreen = .home
        }
    }
    
    func goHomeScreen() {
        currentScreen = .home
        name = ""
        dateBirthday = Date()
        displayedDateText = "Выбрать дату"
    }
    
    func validateName() {
        isNameValid = name.isCyrillicOnly
    }
    
    func validateDate() {
        isDateValid = displayedDateText.lowercased() != "Выбрать дату".lowercased()
    }
    
    func updateDisplayedDate() {
        displayedDateText = dateBirthday.formattedDate()
        isDateValid = true
    }

    func toggleDatePicker() {
        isDatePickerPresented.toggle()
    }
    
    func startOnboardingAudio(audioVisualizer: AudioVisualizer) {
        if !onboardingAudioIsFinished, let audioURL = Bundle.main.url(forResource: "CharlotteOnboarding2", withExtension: "mp3") {
            audioVisualizer.playAudio(url: audioURL) { [weak self] in
                DispatchQueue.main.async {
                    withAnimation(.easeIn(duration: 1)) {
                        self?.onboardingAudioIsFinished = true
                    }
                }
            }
        }
    }
    
    func startPreloadAudio(audioVisualizer: AudioVisualizer) {
        if !preloadAudioIsFinished, let audioURL = Bundle.main.url(forResource: "CharlottePreloadMatrixData", withExtension: "mp3") {
            audioVisualizer.playAudio(url: audioURL) { [weak self] in
                DispatchQueue.main.async {
                    withAnimation(.easeIn(duration: 1)) {
                        self?.preloadAudioIsFinished = true
                    }
                }
            }
        }
    }
    
    func stopPreloadAudio(audioVisualizer: AudioVisualizer) {
        audioVisualizer.stopVoice()
    }
}
