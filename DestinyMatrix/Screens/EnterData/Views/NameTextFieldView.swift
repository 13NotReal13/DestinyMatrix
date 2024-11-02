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
            
            TextField("ПОЛНОЕ ИМЯ", text: $enterDataViewModel.name)
                .multilineTextAlignment(.center)
                .customText(fontSize: 16, textColor: .black)
                .customButtonStyle(color1: .lightAroundSphere, color2: .lightAroundSphere, shape: .capsule)
        }
        .frame(width: UIScreen.main.bounds.width * 0.55)
    }
}

#Preview {
    NameTextFieldView(enterDataViewModel: EnterDataViewModel())
}
