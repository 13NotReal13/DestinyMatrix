//
//  DatePickerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    @Binding var isDatePickerPresented: Bool
    @Binding var dateBirthday: Date
    @State var dateFormatter: DateFormatter
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack {
                Text("Выберите вашу дату рождения")
                    .customText(fontSize: 12, textColor: .white)
                
                Button(action: {
                    isDatePickerPresented.toggle()
                }) {
                    HStack {
                        Text(dateFormatter.string(from: dateBirthday))
                            .foregroundStyle(.black)
                            .shadow(color: .purple, radius: 5)
                            .frame(width: UIScreen.main.bounds.width * 0.55)
                    }
                    .customButtonStyle(color1: .lightAroundSphere, color2: .lightAroundSphere, shape: .capsule)
                }
                .sheet(isPresented: $isDatePickerPresented) {
                    ZStack {
                        AnimatedStarryBackgroundView()
                        
                        VStack {
                            DatePicker("Дата рождения", selection: $dateBirthday, displayedComponents: .date)
                                .environment(\.locale, Locale(identifier: "ru"))
                                .datePickerStyle(.wheel)
                                .colorInvert()
                                .colorMultiply(Color.white)
                                .labelsHidden()
                                .padding()
                            
                            Button {
                                isDatePickerPresented = false
                            } label: {
                                Text("Готово")
                                    .padding(.horizontal)
                                    .customText(fontSize: 16, textColor: .white)
                                    .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                            }
                        }
                    }
                }
                .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    DatePickerView(
        isDatePickerPresented: .constant(false),
        dateBirthday: .constant(Date()),
        dateFormatter: {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.locale = Locale(identifier: "ru")
            return formatter
        }())
}
