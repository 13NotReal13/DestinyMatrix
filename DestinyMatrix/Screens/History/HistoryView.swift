//
//  HistoryView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/11/2024.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var storageManager = StorageManager()
    
    @State private var showDeleteAlert = false
    @State private var selectedMatrix: ShortMatrixData? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack {
                    if storageManager.historyMatrixData.isEmpty {
                        EmptyHistoryView()
                    } else {
                        Text("Удерживайте имя, чтобы удалить запись из истории")
                            .customText(fontSize: 10, textColor: .gray)
                        
                        MatrixListView(
                            matrices: storageManager.historyMatrixData,
                            onLongPress: { matrix in
                                selectedMatrix = matrix
                                showDeleteAlert = true
                            }
                        )
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    CustomBackButtonView { presentationMode.wrappedValue.dismiss() }
                }
                
                ToolbarItem(placement: .principal) {
                    CustomNavigationTitleView(title: "История")
                }
            }
            .deleteMatrixAlert(
                isPresented: $showDeleteAlert,
                matrix: selectedMatrix,
                onDelete: {
                    if let matrix = selectedMatrix {
                        withAnimation {
                            storageManager.delete(shortMatrixData: matrix)
                        }
                    }
                }
            )
            .onAppear {
                FirebaseLogManager.shared.logScreenView(screenName: "history")
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HistoryView()
}
