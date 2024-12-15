//
//  NameTextFieldView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct NameTextFieldView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text("Введите ваше полное имя (только имя)")
                .customText(fontSize: 14, textColor: .white)
            
            VStack {
                TextField("ПОЛНОЕ ИМЯ", text: $homeViewModel.name)
                    .textContentType(.none)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.center)
                    .customText(fontSize: 16, textColor: .black)
                    .onChange(of: homeViewModel.name) { _ in
                        homeViewModel.validateName()
                    }
            }
            .frame(maxWidth: .infinity)
            .customButtonStyle(
                color1: .lightAroundSphere,
                color2: .lightAroundSphere,
                shape: .capsule
            )
            
            if !homeViewModel.isNameValid {
                Text("Допустимые символы: \"А-Я\"")
                    .customText(fontSize: 12, textColor: .red)
            }
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        NameTextFieldView()
            .environmentObject(HomeViewModel())
    }
}
