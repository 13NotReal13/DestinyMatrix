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
        ZStack {
            VStack {
                ZStack {
                    Image("BackgroundPurchaseScreen")
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height * 0.4)
                        .ignoresSafeArea(edges: .horizontal)
                        .ignoresSafeArea(edges: .top)
                        .mask(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: .white, location: 0.9),
                                    .init(color: .clear, location: 1)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                    Text("Матрица Судьбы")
                        .customText(fontSize: 29, textColor: .white)
                        .padding()
                }
                
                Spacer()
            }
            
            VStack(spacing: 16) {
                Spacer()
                
                DescriptionPurchaseView()
                
//                Text("Чтобы продолжить, необходимо приобрести доступ к расчёту Матрицы Судьбы.")
//                    .multilineTextAlignment(.center)
//                    .font(.system(size: 11))
//                    .foregroundStyle(.secondary)
//                    .padding(.horizontal)
                
                Button(action: {
                    // Логика покупки
                    print("Покупка начата")
                    
                    // После успешной покупки
                    isPresented = false // Закрываем модальное окно
                    navigateToMatrix = true // Инициируем переход
                }) {
                    Text("Приобрести за 12.99 $")
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
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    PurchaseModalView(isPresented: .constant(true), navigateToMatrix: .constant(false))
        .preferredColorScheme(.dark)
}
