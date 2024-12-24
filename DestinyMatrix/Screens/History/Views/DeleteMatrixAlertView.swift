//
//  DeleteMatrixAlertView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct DeleteMatrixAlertView: ViewModifier {
    @Binding var isPresented: Bool
    var matrix: ShortMatrixData?
    var onDelete: () -> Void
    
    func body(content: Content) -> some View {
        content.alert(
            "Удалить матрицу?",
            isPresented: $isPresented,
            actions: {
                Button("Удалить", role: .destructive, action: onDelete)
                Button("Отмена", role: .cancel) {}
            },
            message: {
                Text("Вы уверены, что хотите удалить матрицу \(matrix?.name ?? "неизвестно") - \(matrix?.dateOfBirthday.formattedDate() ?? "неизвестно")?")
            }
        )
    }
}

extension View {
    func deleteMatrixAlert(
        isPresented: Binding<Bool>,
        matrix: ShortMatrixData?,
        onDelete: @escaping () -> Void
    ) -> some View {
        self.modifier(DeleteMatrixAlertView(
            isPresented: isPresented,
            matrix: matrix,
            onDelete: onDelete
        ))
    }
}
