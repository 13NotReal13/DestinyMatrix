//
//  PurchaseModalView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 13/01/2025.
//

import SwiftUI

struct PurchaseModalView: View {
    @Binding var isPresented: Bool
    @Binding var navigateToMatrix: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Покупка Матрицы Судьбы")
                .font(.headline)
                .padding()
            
            Text("Чтобы продолжить, необходимо приобрести доступ к расчёту Матрицы Судьбы.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                // Логика покупки
                print("Покупка начата")
                
                // После успешной покупки
                isPresented = false // Закрываем модальное окно
                navigateToMatrix = true // Инициируем переход
            }) {
                Text("Приобрести")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button(action: {
                isPresented = false // Закрываем окно
            }) {
                Text("Отмена")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.6).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    PurchaseModalView(isPresented: .constant(true), navigateToMatrix: .constant(false))
        .preferredColorScheme(.dark)
}
