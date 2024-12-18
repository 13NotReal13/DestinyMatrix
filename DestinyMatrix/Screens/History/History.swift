//
//  HistoryView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/11/2024.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var storageManager = StorageManager()
    
    @State private var showDeleteAlert = false
    @State private var selectedMatrixForDelete: ShortMatrixData? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    if storageManager.historyMatrixData.isEmpty {
                        Spacer()
                        Text("Нет истории")
                            .customText(fontSize: 17, textColor: .white)
                        Spacer()
                    } else {
                        Text("Удерживайте имя, чтобы удалить запись из истории")
                            .customText(fontSize: 10, textColor: .gray)
                            .padding(.top, 8)
                        
                        List {
                            ForEach(storageManager.historyMatrixData) { matrix in
                                VStack(spacing: 8) {
                                    HStack {
                                        Text("\(matrix.name)")
                                            .onLongPressGesture {
                                                selectedMatrixForDelete = matrix
                                                showDeleteAlert = true
                                            }
                                        Text(" - \(matrix.dateOfBirthday.formattedDate())")
                                    }
                                    .customText(fontSize: 17, textColor: .white)
                                    
                                    Text("Дата создания: \(matrix.dateCreationMatrix.formattedDate())")
                                        .customText(fontSize: 11, textColor: .white)
                                }
                                .frame(maxWidth: .infinity)
                                .customButtonStyle(shape: .capsule)
                                .listRowBackground(Color.clear)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .customText(fontSize: 17, textColor: .white)
                            .customBarButtonStyle(shape: .capsule)
                    }
                }
            }
            .alert(isPresented: $showDeleteAlert) {
                let matrixName = selectedMatrixForDelete?.name ?? "неизвестно"
                let matrixDate = selectedMatrixForDelete?.dateOfBirthday.formattedDate() ?? "неизвестно"
                
                return Alert(
                    title: Text("Удалить матрицу?"),
                    message: Text("Вы уверены, что хотите удалить матрицу \(matrixName) - \(matrixDate)?"),
                    primaryButton: .destructive(Text("Удалить")) {
                        if let matrix = selectedMatrixForDelete {
                            withAnimation {
                                storageManager.delete(shortMatrixData: matrix)
                            }
                        }
                    },
                    secondaryButton: .cancel(Text("Отмена"))
                )
            }
        }
    }
}

#Preview {
    HistoryView()
}
