//
//  MatrixListView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct MatrixListView: View {
    let matrices: [ShortMatrixData]
    var onLongPress: (ShortMatrixData) -> Void
    
    var body: some View {
        ScrollView {
            ForEach(matrices) { matrix in
                ZStack {
                    VStack(spacing: 8) {
                        HStack {
                            Text("\(matrix.name)")
                                .onLongPressGesture {
                                    onLongPress(matrix)
                                }
                            Text(" - \(matrix.dateOfBirthday.formattedDate())")
                        }
                        .customText(fontSize: 17, textColor: .white)
                        
                        Text("Дата создания: \(matrix.dateCreationMatrix.formattedDate())")
                            .customText(fontSize: 11, textColor: .white)
                    }
                    .frame(maxWidth: .infinity)
                    .customButtonStyle(shape: .capsule)
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(
                            destination: MatrixView(
                                matrixData: MatrixCalculation(
                                    name: matrix.name,
                                    dateOfBirthday: matrix.dateOfBirthday
                                ).matrixData
                            )) {
                                Image(systemName: "chevron.right")
                                    .customText(fontSize: 17, textColor: .white)
                                    .padding()
                            }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    // Создаём тестовые данные
    let date1 = Calendar.current.date(from: DateComponents(year: 1994, month: 1, day: 19))!
    let date2 = Calendar.current.date(from: DateComponents(year: 1998, month: 5, day: 25))!
    
    let testMatrices = [
        ShortMatrixData(
            name: "Иван",
            dateOfBirthday: date1,
            dateCreationMatrix: Date()
        ),
        ShortMatrixData(
            name: "Анна",
            dateOfBirthday: date2,
            dateCreationMatrix: Date()
        )
    ]
    
    return MatrixListView(
        matrices: testMatrices,
        onLongPress: { _ in } // Действие при долгом нажатии
    )
}

