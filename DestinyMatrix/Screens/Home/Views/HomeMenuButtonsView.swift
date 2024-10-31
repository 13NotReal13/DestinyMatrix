//
//  HomeMenuButtonsView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import SwiftUI

struct HomeMenuButtonsView: View {
    var body: some View {
        VStack {
//            HStack {
//                Spacer()
//                
//                Text("1")
//                    .customText(fontSize: 90)
//                    .padding()
//                    .background(
//                        LinearGradient(
//                            colors: [.backgroundColor1],
//                            startPoint: .bottom,
//                            endPoint: .top
//                        )
//                    )
//                    .overlay(
//                        Circle()
//                            .stroke(Color.white, lineWidth: 2)
//                    )
//                    .clipShape(.circle)
//                
//                Spacer()
//                
//                Text("7")
//                    .customText(fontSize: 90)
//                    .padding()
//                    .background(
//                        LinearGradient(
//                            colors: [.backgroundColor1, .buttonColor2],
//                            startPoint: .bottom,
//                            endPoint: .top
//                        )
//                    )
//                    .overlay(
//                        Circle()
//                            .stroke(Color.white, lineWidth: 2)
//                    )
//                    .clipShape(.circle)
//                
//                Spacer()
//                
//                Text("5")
//                    .customText(fontSize: 40)
//                
//                Spacer()
//                
//                Text("5")
//                    .customText(fontSize: 40)
//                
//                Spacer()
//            }
            
            HStack() {
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "questionmark")
                        .customText(fontSize: 34)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.backgroundColor1, .buttonColor2],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .clipShape(.circle)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Рассчитать матрицу")
                        .customText(fontSize: 16)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.backgroundColor2, .buttonColor2],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .clipShape(.capsule)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "book.pages")
                        .customText(fontSize: 24)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.backgroundColor1, .buttonColor2],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .clipShape(.circle)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeMenuButtonsView()
}
