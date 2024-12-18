//
//  DatePickerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text("Выберите вашу дату рождения")
                .customText(fontSize: 14, textColor: .white)
            
            Button(action: {
                homeViewModel.isDatePickerPresented.toggle()
            }) {
                HStack {
                    if homeViewModel.displayedDateText.lowercased() == "Выбрать дату".lowercased() {
                        Text(homeViewModel.displayedDateText)
                            .font(.custom(CustomFont.fontName.rawValue, size: 16))
                            .foregroundStyle(Color.gray.opacity(0.6))
                    } else {
                        Text(homeViewModel.displayedDateText)
                            .customText(fontSize: 16, textColor: .black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.6)
                .customButtonStyle(
                    color1: .lightAroundSphere,
                    color2: .lightAroundSphere,
                    shape: .capsule
                )
            }
            .sheet(isPresented: $homeViewModel.isDatePickerPresented) {
                ZStack {
                    AnimatedStarryBackgroundView()
                        .ignoresSafeArea()
                    
                    VStack {
                        DatePicker("Дата рождения", selection: $homeViewModel.dateBirthday, displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "ru"))
                            .datePickerStyle(.wheel)
                            .colorInvert()
                            .colorMultiply(Color.white)
                            .labelsHidden()
                            .padding()
                            .onChange(of: homeViewModel.dateBirthday) { _ in
                                homeViewModel.updateDisplayedDate()
                            }
                        
                        Button {
                            homeViewModel.isDatePickerPresented = false
                        } label: {
                            Text("Готово")
                                .frame(width: UIScreen.main.bounds.width * 0.6)
                                .customText(fontSize: 16, textColor: .white)
                                .customButtonStyle(shape: .capsule)
                        }
                    }
                    .padding()
                }
                .ignoresSafeArea()
            }
            
            if !homeViewModel.isDateValid {
                Text("Выберите дату")
                    .customText(fontSize: 12, textColor: .red)
            }
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        DatePickerView()
            .environmentObject(HomeViewModel())
    }
}
