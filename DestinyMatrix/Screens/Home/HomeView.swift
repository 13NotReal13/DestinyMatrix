//
//  HomeView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 27/10/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            Image(.background)
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Матрица Судьбы")
                    .font(.custom("CorrectionBrush", size: 36)) // Замените "MagicFont" на название вашего шрифта
                    .foregroundColor(.white)
                    .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0) // Добавляет магическое свечение
                    .padding(.bottom, 20)
                
                ZStack {
                    Rotating3DSphereView(iamegName: Shape.shape1.rawValue)
                        .frame(width: 300, height: 300)
                }
                
                Spacer()
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Рассчитать матрицу")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.5)
                        .background(.colorButton)
                        .clipShape(.rect(cornerRadius: 40))
                        .foregroundStyle(.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth: 1)
                        }
                }
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
