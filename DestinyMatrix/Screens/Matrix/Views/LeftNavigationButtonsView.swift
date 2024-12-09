//
//  LeftNavigationButtonView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct LeftNavigationButtonsView: View {
    @Binding var selectedSection: Int
    @Binding var selectedSectionForLeftButtons: Int
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(1..<14) { num in
                Spacer()
                
                Text(HelpInfoViewModel().categories[num - 1].title)
                    .customText(fontSize: 17, textColor: .white)
                    .foregroundStyle(.white)
                    .padding(8)
                    .overlay {
                        if num == selectedSectionForLeftButtons {
                            Capsule()
                                .stroke(Color.white, lineWidth: 2)
                        }
                    }
//                    .shadow(color: .white, radius: num == selectedSectionForLeftButtons ? 5 : 0)
                    .onTapGesture {
                        
                        withAnimation {
                            isMenuOpen = false
                            selectedSection = num
                        }
                    }
                
                if num != 13 {
                    Divider()
                        .frame(height: 1)
                        .background(.white.opacity(0.4))
                }
            }
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        LeftNavigationButtonsView(
            selectedSection: .constant(1),
            selectedSectionForLeftButtons: .constant(1),
            isMenuOpen: .constant(false)
        )
    }
}
