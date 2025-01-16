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
                .font(.subheadline)
                .foregroundColor(.primary)
            
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
            .background {
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.8), Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
            }
//            .overlay {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.cyan, lineWidth: 1)
//            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal)
    }
}

#Preview {
    DescriptionPurchaseView()
        .preferredColorScheme(.dark)
}
