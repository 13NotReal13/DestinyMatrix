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
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack(spacing: 20) {
                Spacer()
                
                VStack {
                    Text("Введите ваше полное имя (только имя)")
                        .customText(fontSize: 12)
                    
                    TextField("полное имя", text: $name)
                        .multilineTextAlignment(.center)
                        .customText(fontSize: 16)
                        .frame(width: UIScreen.main.bounds.width * 0.55)
                        .customButtonStyle(color1: .lightAroundSphere, color2: .lightAroundSphere, shape: .capsule)
                }
                
                VStack {
                    Text("Выберите вашу дату рождения")
                        .customText(fontSize: 12)
                    
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
                                        .customText(fontSize: 16)
                                        .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                                }
                            }
                        }
                    }
                    .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Далее")
                        .padding(.horizontal)
                        .customText(fontSize: 16)
                        .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                }
                
                Spacer()
            }
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ru")
        return formatter
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
