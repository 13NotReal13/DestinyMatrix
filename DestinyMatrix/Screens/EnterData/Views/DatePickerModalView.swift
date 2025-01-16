//
//  DatePickerModalView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct DatePickerModalView: View {
    @ObservedObject var enterDataViewModel: EnterDataViewModel
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
                .ignoresSafeArea()
            
            VStack {
                // Выбор даты
                DatePicker("Дата рождения", selection: $enterDataViewModel.dateBirthday, displayedComponents: .date)
                    .environment(\.locale, Locale(identifier: "ru"))
                    .datePickerStyle(.wheel)
                    .colorInvert()
                    .colorMultiply(Color.white)
                    .labelsHidden()
                    .padding()
                    .onChange(of: enterDataViewModel.dateBirthday) { _ in
                        enterDataViewModel.updateDisplayedDate()
                    }
                
                // Кнопка закрытия
                Button {
                    enterDataViewModel.isDatePickerPresented = false
                } label: {
                    Text("Готово")
                        .frame(width: UIScreen.main.bounds.width * 0.2)
                        .customText(fontSize: 16, textColor: .white)
                        .customButtonStyle(shape: .capsule)
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DatePickerModalView(enterDataViewModel: EnterDataViewModel())
}
