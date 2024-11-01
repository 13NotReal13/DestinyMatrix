//
//  DatePickerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    @ObservedObject var viewModel: EnterDataViewModel
    
    var body: some View {
        VStack {
            Text("Выберите вашу дату рождения")
                .customText(fontSize: 12, textColor: .white)
            
            Button(action: {
                viewModel.isDatePickerPresented.toggle()
            }) {
                HStack {
                    if viewModel.displayedDateText.lowercased() == "Выбрать дату".lowercased() {
                        Text(viewModel.displayedDateText)
                            .font(.custom(CustomFont.fontName.rawValue, size: 15))
                            .foregroundStyle(Color.gray.opacity(0.6))
                            .frame(width: UIScreen.main.bounds.width * 0.55)
                    } else {
                        Text(viewModel.displayedDateText)
                            .customText(fontSize: 16, textColor: .black)
                            .frame(width: UIScreen.main.bounds.width * 0.55)
                    }
                }
                .customButtonStyle(color1: .lightAroundSphere, color2: .lightAroundSphere, shape: .capsule)
            }
            .sheet(isPresented: $viewModel.isDatePickerPresented) {
                ZStack {
                    AnimatedStarryBackgroundView()
                    
                    VStack {
                        DatePicker("Дата рождения", selection: $viewModel.dateBirthday, displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "ru"))
                            .datePickerStyle(.wheel)
                            .colorInvert()
                            .colorMultiply(Color.white)
                            .labelsHidden()
                            .padding()
                            .onChange(of: viewModel.dateBirthday) { _, _ in
                                viewModel.updateDisplayedDate()
                            }
                        
                        Button {
                            viewModel.isDatePickerPresented = false
                        } label: {
                            Text("Готово")
                                .padding(.horizontal)
                                .customText(fontSize: 16, textColor: .white)
                                .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DatePickerView(viewModel: EnterDataViewModel())
}
