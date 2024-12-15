//
//  HistoryView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/11/2024.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    
    private let matrixList = StorageManager().historyMatrixData
//    private let matrixList = Array(repeating: ShortMatrixData(name: "Анастасия", dateOfBirthday: .now, dateCreationMatrix: .now), count: 15)
    
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
                            .customBarButtonStyle(shape: .capsule)
                    }
                    
                    Spacer()
                }
                
                if matrixList.isEmpty {
                    Spacer()
                    Text("Нет истории")
                        .customText(fontSize: 17, textColor: .white)
                    Spacer()
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(matrixList, id: \.self) { matrix in
                            VStack(spacing: 8) {
                                HStack {
                                    Text("\(matrix.name) - \(matrix.dateOfBirthday.formattedDate())")
                                }
                                .customText(fontSize: 17, textColor: .white)
                                
                                Text("Дата создания: \(matrix.dateCreationMatrix.formattedDate())")
                                    .customText(fontSize: 11, textColor: .white)
                            }
                            .frame(maxWidth: .infinity)
                            .customButtonStyle(shape: .capsule)
                            .padding(.top, 11)
                        }
                        
                        VStack { }.frame(height: 100)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    HistoryView()
}
