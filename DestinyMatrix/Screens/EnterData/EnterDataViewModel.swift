//
//  EnterDataViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 23/12/2024.
//

import Foundation

final class EnterDataViewModel: ObservableObject {
    @Published var canNavigate = false
    
    @Published var name: String = ""
    @Published var dateBirthday: Date = Date()
    @Published var displayedDateText: String = "Выбрать дату"
    
    @Published var isNameValid: Bool = true
    @Published var isDateValid: Bool = true
    
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
