//
//  EnterDataViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

final class EnterDataViewModel: ObservableObject {
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

    func toggleDatePicker() {
        isDatePickerPresented.toggle()
    }
}
