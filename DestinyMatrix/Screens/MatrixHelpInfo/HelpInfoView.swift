//
//  MatrixHelpInfoView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/12/2024.
//

import SwiftUI

struct MatrixHelpInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    private let categories = HelpInfoViewModel().categories
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack(alignment: .center) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .customText(fontSize: 17, textColor: .white)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Text("Содержание:")
                    .font(.system(size: 28))
                    .foregroundStyle(.white)
                    .padding(.bottom, 16)
                
                ScrollView {
                    VStack(spacing: 8) {
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
                            
                            VStack(spacing: 16) {
                                ForEach(category.subcategories, id: \.title) { subcategory in
                                    VStack(alignment: .leading, spacing: 4) {
                                        // Заголовок подкатегории
                                        Text(subcategory.title + ":")
                                            .font(.system(size: 20))
                                            .foregroundStyle(.white)
                                        // Описание подкатегории
                                        Text(subcategory.description)
                                            .font(.system(size: 17))
                                            .foregroundStyle(.white.opacity(0.8))
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MatrixHelpInfoView()
}
