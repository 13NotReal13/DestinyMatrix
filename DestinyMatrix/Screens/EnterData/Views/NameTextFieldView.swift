//
//  NameTextFieldView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct NameTextFieldView: View {
    @Binding var name: String
    @Binding var isNameValid: Bool
    
    var validateName: () -> Void
    
    var body: some View {
        VStack {
            Text("Введите ваше полное имя (только имя)")
                .customText(fontSize: 12, textColor: .white)
            
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
                
                
                TextField(
                    "",
                    text: $name,
                    prompt: Text("ПОЛНОЕ ИМЯ")
                        .foregroundColor(Color.white.opacity(0.65))
                )
                .textContentType(.none)
                .disableAutocorrection(true)
                .multilineTextAlignment(.center)
                .customText(fontSize: 16, textColor: .white)
                .onChange(of: name) { newValue in
                    name = newValue.replacingOccurrences(of: " ", with: "")
                    validateName()
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            
            VStack {
                if !isNameValid {
                    Text("Допустимые символы: \"А-Я\"")
                        .customText(fontSize: 12, textColor: .red)
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.01)
        }
    }
}
