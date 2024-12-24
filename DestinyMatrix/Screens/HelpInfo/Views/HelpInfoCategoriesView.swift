//
//  HelpInfoCategoriesView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct HelpInfoCategoriesView: View {
    let categories: [ArkanInfo]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(categories, id: \.title) { category in
                    Text(category.title)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            VStack(spacing: 16) {
                ForEach(categories, id: \.title) { category in
                    // Заголовок категории
                    Text(category.title)
                        .font(.system(size: 21))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.top)
                    
                    VStack(spacing: 16) {
                        ForEach(category.subcategories, id: \.title) { subcategory in
                            VStack(alignment: .leading, spacing: 4) {
                                // Заголовок подкатегории
                                Text(subcategory.title)
                                    .foregroundStyle(.white)
                                // Описание подкатегории
                                Text(subcategory.shortDescription)
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            
            CustomSpacerView(height: 0.05)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        HelpInfoCategoriesView(categories: HelpInfoViewModel().categories)
    }
}
