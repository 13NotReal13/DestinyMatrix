//
//  HelpInfoView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/12/2024.
//

import SwiftUI

struct HelpInfoView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    private let categories = HelpInfoViewModel().categories
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack(alignment: .center) {
                HStack {
                    Button {
                        homeViewModel.goHomeScreen()
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .customText(fontSize: 17, textColor: .white)
                            .customBarButtonStyle(shape: .capsule)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 8) {
                        Text("Содержание:")
                            .font(.system(size: 28))
                            .foregroundStyle(.white)
                            .padding(.bottom, 16)
                            .padding(.top, 30)
                        
                        ForEach(categories, id: \.title) { category in
                            Text(category.title)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16) {
                        ForEach(categories, id: \.title) { category in
                            // Заголовок категории
                            Text(category.title)
                                .font(.system(size: 24))
                                .foregroundStyle(.white)
                                .padding(.top)
                            
                            VStack(spacing: 16) {
                                ForEach(category.subcategories, id: \.title) { subcategory in
                                    VStack(alignment: .leading, spacing: 4) {
                                        // Заголовок подкатегории
                                        Text(subcategory.title)
                                            .font(.system(size: 20))
                                            .foregroundStyle(.white)
                                        // Описание подкатегории
                                        Text(subcategory.shortDescription)
                                            .font(.system(size: 17))
                                            .foregroundStyle(.white.opacity(0.7))
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding()
                }
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .white, location: 0.1),
                            .init(color: .white, location: 0.9),
                            .init(color: .clear, location: 1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
    }
}

#Preview {
    HelpInfoView()
}
