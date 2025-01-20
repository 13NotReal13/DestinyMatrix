//
//  DescriptionPurchaseView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/01/2025.
//

import SwiftUI

struct DescriptionPurchaseView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Что вы получите:")
                .customText(fontSize: 15, textColor: .white)
                .padding(.leading, 6)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    
                    PurchaseFeatureView(
                        title: "Индивидуальный анализ",
                        description: "Детальная интерпретация вашей матрицы судьбы на основе имени и даты рождения."
                    )
                }
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    
                    PurchaseFeatureView(
                        title: "13 разделов анализа",
                        description: "Обширные категории, включая судьбу, карьеру, здоровье, отношения и многое другое."
                    )
                }
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    
                    PurchaseFeatureView(
                        title: "Рекомендации и советы",
                        description: "Практические рекомендации для достижения гармонии и успеха в жизни."
                    )
                }
                HStack {
                    Image(systemName: "square.and.arrow.down.fill")
                        .foregroundStyle(.green)
                    
                    PurchaseFeatureView(
                        title: "PDF-отчёт",
                        description: "Возможность скачать полный отчёт вашей матрицы в удобном формате PDF."
                    )
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.cyan, lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(.horizontal)
    }
}

#Preview {
    DescriptionPurchaseView()
        .preferredColorScheme(.dark)
}
