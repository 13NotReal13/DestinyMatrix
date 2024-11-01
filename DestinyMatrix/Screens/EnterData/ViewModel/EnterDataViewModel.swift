//
//  EnterDataViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI
import Combine

final class EnterDataViewModel: ObservableObject {
    @Published var dateBirthday: Date = Date()
    @Published var displayedDateText: String = ""
    @Published var isDatePickerPresented: Bool = false

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ru")
        return formatter
    }

    func updateDisplayedDate() {
        displayedDateText = dateFormatter.string(from: dateBirthday)
    }
    
    func toggleDatePicker() {
        isDatePickerPresented.toggle()
    }
}
