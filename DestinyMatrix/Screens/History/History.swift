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
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    @State private var showDeleteAlert = false
    @State private var selectedMatrix: ShortMatrixData? = nil
    
    @State private var showMatrixView = false
    
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
                                                selectedMatrix = matrix
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
                                .onTapGesture {
                                    selectedMatrix = matrix
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        showMatrixView = true
                                    }
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        homeViewModel.goHomeScreen()
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .customText(fontSize: 17, textColor: .white)
                            .customBarButtonStyle(shape: .capsule)
                    }
                }
            }
            .alert(isPresented: $showDeleteAlert) {
                let matrixName = selectedMatrix?.name ?? "неизвестно"
                let matrixDate = selectedMatrix?.dateOfBirthday.formattedDate() ?? "неизвестно"
                
                return Alert(
                    title: Text("Удалить матрицу?"),
                    message: Text("Вы уверены, что хотите удалить матрицу \(matrixName) - \(matrixDate)?"),
                    primaryButton: .destructive(Text("Удалить")) {
                        if let matrix = selectedMatrix {
                            withAnimation {
                                storageManager.delete(shortMatrixData: matrix)
                            }
                        }
                    },
                    secondaryButton: .cancel(Text("Отмена"))
                )
            }
            .fullScreenCover(isPresented: $showMatrixView) {
                MatrixView(
                    matrixData: MatrixCalculation(
                        name: selectedMatrix?.name ?? "",
                        dateOfBirthday: selectedMatrix?.dateOfBirthday ?? Date()
                    )
                    .matrixData
                )
            }
        }
    }
}

#Preview {
    HistoryView()
}
