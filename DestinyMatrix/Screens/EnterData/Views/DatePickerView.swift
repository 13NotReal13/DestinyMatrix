//
//  DatePickerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    @ObservedObject var enterDataViewModel: EnterDataViewModel
    
    var body: some View {
        VStack {
            Text("Выберите вашу дату рождения")
                .customText(fontSize: 12, textColor: .white)
            
            Button(action: {
                enterDataViewModel.isDatePickerPresented.toggle()
            }) {
                HStack {
                    if enterDataViewModel.displayedDateText.lowercased() == "Выбрать дату".lowercased() {
                        Text(enterDataViewModel.displayedDateText)
                            .font(.custom(CustomFont.fontName.rawValue, size: 15))
                            .foregroundStyle(Color.gray.opacity(0.6))
                    } else {
                        Text(enterDataViewModel.displayedDateText)
                            .customText(fontSize: 16, textColor: .black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.55)
                .customButtonStyle(color1: .lightAroundSphere, color2: .lightAroundSphere, shape: .capsule)
            }
            .sheet(isPresented: $enterDataViewModel.isDatePickerPresented) {
                ZStack {
                    AnimatedStarryBackgroundView()
                        .ignoresSafeArea()
                    
                    VStack {
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
                        
                        Button {
                            enterDataViewModel.isDatePickerPresented = false
                        } label: {
                            Text("Готово")
                                .padding(.horizontal)
                                .customText(fontSize: 16, textColor: .white)
                                .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    DatePickerView(enterDataViewModel: EnterDataViewModel())
}
