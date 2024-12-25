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
            
            VStack {
                TextField(
                    "",
                    text: $name,
                    prompt: Text("ПОЛНОЕ ИМЯ")
                    .foregroundColor(Color.gray.opacity(0.65))
                )
                .textContentType(.none)
                .disableAutocorrection(true)
                .multilineTextAlignment(.center)
                .customText(fontSize: 16, textColor: .black)
                .onChange(of: name) { newValue in
                    name = newValue.replacingOccurrences(of: " ", with: "")
                    validateName()
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.6)
            .customButtonStyle(
                color1: .lightAroundSphere,
                color2: .lightAroundSphere,
                shape: .capsule
            )
            
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
