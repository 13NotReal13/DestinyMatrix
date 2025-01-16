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
    @Binding var displayedDateText: String
    @Binding var isDateValid: Bool
    
    var body: some View {
        VStack {
            Text("Выберите вашу дату рождения")
                .customText(fontSize: 12, textColor: .white)
            
            Button(action: {
                UIApplication.shared.connectedScenes
                    .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                    .first?
                    .endEditing(true)
                isDatePickerPresented.toggle()
            }) {
                ZStack {
                    Color.clear
                        .frame(width: UIScreen.main.bounds.width * 0.5)
                        .frame(height: UIScreen.main.bounds.height * 0.02)
                        .customButtonStyle(
                            color1: .backgroundColor1,
                            color2: .backgroundColor2,
                            shape: .capsule
                        )
                        .opacity(0.7)
                    
                    HStack {
                        if displayedDateText.lowercased() == "Выбрать дату".lowercased() {
                            Text(displayedDateText)
                                .font(.custom(CustomFont.fontName.rawValue, size: 16))
                                .foregroundStyle(Color.white.opacity(0.6))
                        } else {
                            Text(displayedDateText)
                                .customText(fontSize: 16, textColor: .white)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
            }
            
            VStack {
                if !isDateValid {
                    Text("Выберите дату")
                        .customText(fontSize: 12, textColor: .red)
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.01)
        }
    }
}


