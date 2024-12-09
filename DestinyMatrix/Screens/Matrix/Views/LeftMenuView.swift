//
//  LeftMenuView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/12/2024.
//

import SwiftUI

struct LeftMenuView: View {
    @EnvironmentObject private var matrixViewModel: MatrixViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.black.opacity(matrixViewModel.isMenuOpen ? 0.5 : 0)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation { matrixViewModel.isMenuOpen = false }
                }
            
            ZStack(alignment: .leading) {
                BackgroundLeftMenuView()
                    .frame(width: 282)
                
                HStack(spacing: 0) {
                    LeftNavigationButtonsView()
                        .frame(width: 250)
                        .padding(.horizontal)
                    
                    LeftMenuButtonView()
                }
            }
            .offset(x: matrixViewModel.isMenuOpen ? 0 : -282)
        }
    }
}

#Preview {
    LeftMenuView()
        .environmentObject(MatrixViewModel())
}
