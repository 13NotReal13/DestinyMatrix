//
//  EnterDataViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI
import Combine

final class EnterDataViewModel: ObservableObject {
    @Published var audioEnterDataIsFinished: Bool = true
    
    @Published var name: String = ""
    @Published var isNameValid: Bool = true
    
    @Published var dateBirthday: Date = Date()
    @Published var isDateValid: Bool = true
    
    @Published var displayedDateText: String = "Выбрать дату"
    @Published var isDatePickerPresented: Bool = false
    
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
    
    func startEnterDataAudio(audioVisualizer: AudioVisualizer) {
        if !audioEnterDataIsFinished, let audioURL = Bundle.main.url(forResource: "CharlotteEnterData", withExtension: "mp3") {
            audioVisualizer.playAudio(url: audioURL) { [weak self] in
                DispatchQueue.main.async {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self?.audioEnterDataIsFinished = true
                    }
                }
            }
        }
    }
    
    func stopAudio(audioVisualizer: AudioVisualizer) {
        audioVisualizer.stopVoice()
    }

    func toggleDatePicker() {
        isDatePickerPresented.toggle()
    }
}
