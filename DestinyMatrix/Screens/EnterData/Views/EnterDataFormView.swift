//
//  EnterDataFormView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct EnterDataFormView: View {
    @ObservedObject var enterDataViewModel: EnterDataViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            NameTextFieldView(
                name: $enterDataViewModel.name,
                isNameValid: $enterDataViewModel.isNameValid,
                validateName: { enterDataViewModel.validateName() }
            )
            
            DatePickerView(
                isDatePickerPresented: $enterDataViewModel.isDatePickerPresented,
                displayedDateText: $enterDataViewModel.displayedDateText,
                isDateValid: $enterDataViewModel.isDateValid
            )
        }
    }
}

#Preview {
    EnterDataFormView(enterDataViewModel: EnterDataViewModel())
}
