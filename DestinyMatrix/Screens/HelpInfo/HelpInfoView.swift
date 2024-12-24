//
//  HelpInfoView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/12/2024.
//

import SwiftUI

struct HelpInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let categories = HelpInfoViewModel().categories
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack(alignment: .center) {
                    CustomSpacerView(height: 0.01)
                    
                    HelpInfoCategoriesView(categories: categories)
                        .padding(.top, -16)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    CustomBackButtonView { presentationMode.wrappedValue.dismiss() }
                }
                
                ToolbarItem(placement: .principal) {
                    CustomNavigationTitleView(title: "Содержание")
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HelpInfoView()
}
