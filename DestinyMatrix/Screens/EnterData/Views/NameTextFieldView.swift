//
//  NameTextFieldView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct NameTextFieldView: View {
    @ObservedObject var enterDataViewModel: EnterDataViewModel
    
    var body: some View {
        VStack {
            Text("Введите ваше полное имя (только имя)")
                .customText(fontSize: 12, textColor: .white)
            
            VStack {
                TextField("ПОЛНОЕ ИМЯ", text: $enterDataViewModel.name)
                    .textContentType(.none)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.center)
                    .customText(fontSize: 16, textColor: .black)
                    .onChange(of: enterDataViewModel.name) { _ in
                        enterDataViewModel.validateName()
                    }
            }
            .frame(width: UIScreen.main.bounds.width * 0.55)
            .customButtonStyle(color1: .lightAroundSphere, color2: .lightAroundSphere, shape: .capsule)
            
            if !enterDataViewModel.isNameValid {
                Text("Допустимы только символы \"А-Я\"")
                    .customText(fontSize: 12, textColor: .red)
            }
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        NameTextFieldView(enterDataViewModel: EnterDataViewModel())
    }
}
