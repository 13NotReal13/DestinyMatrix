//
//  MatrixList.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/11/2024.
//

import SwiftUI

struct MatrixList: View {
    @Environment(\.dismiss) private var dismiss
    
    let matrixList: [MatrixData]
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .customText(fontSize: 17, textColor: .white)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView {
                    ForEach(matrixList, id: \.self) { matrix in
                        HStack {
                            Text(matrix.name)
                            Spacer()
                            Text(matrix.dateOfBirthday.formattedDate())
                        }
                        .customText(fontSize: 19, textColor: .white)
                        .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor2, shape: .capsule)
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity)
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Очистить")
                        .customText(fontSize: 17, textColor: .white)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    MatrixList(matrixList: [
        MatrixCalculation(name: "Иван", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Марина", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Иван", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Марина", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Иван", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Марина", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Иван", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Марина", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Иван", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Марина", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Иван", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Марина", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Иван", dateOfBirthday: .now).matrixData,
        MatrixCalculation(name: "Марина", dateOfBirthday: .now).matrixData
    ])
}
