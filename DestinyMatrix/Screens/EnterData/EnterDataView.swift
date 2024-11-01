//
//  EnterDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct EnterDataView: View {
    @Binding var name: String
    @Binding var dateBirthday: Date
    
    @State private var isDatePickerPresented = false
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ru")
        return formatter
    }
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack(spacing: 20) {
                Spacer()
                
                VStack {
                    Text("Введите ваше полное имя (только имя)")
                        .customText(fontSize: 12, textColor: .white)
                    
                    TextField("полное имя", text: $name)
                        .multilineTextAlignment(.center)
                        .customText(fontSize: 16, textColor: .black)
                        .frame(width: UIScreen.main.bounds.width * 0.55)
                        .customButtonStyle(color1: .lightAroundSphere, color2: .lightAroundSphere, shape: .capsule)
                }
                
                VStack {
                    DatePickerView(
                        isDatePickerPresented: $isDatePickerPresented,
                        dateBirthday: $dateBirthday,
                        dateFormatter: dateFormatter
                    )
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Далее")
                        .padding(.horizontal)
                        .customText(fontSize: 16, textColor: .white)
                        .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                }
                
                Spacer()
            }
        }
    }
}

// Превью для EnterDataView
struct EnterDataView_Previews: PreviewProvider {
    @State static var name = ""
    @State static var dateBirthday = Date()
    
    static var previews: some View {
        EnterDataView(name: $name, dateBirthday: $dateBirthday)
    }
}
