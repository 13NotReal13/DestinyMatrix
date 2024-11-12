//
//  LeftNavigationButtonView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import SwiftUI

struct LeftNavigationButtonsView: View {
    @Binding var selectedSection: Int
    
    var body: some View {
        VStack {
            ForEach(1..<13) { num in
                Spacer()
                
                Text(String(num))
                    .customText(fontSize: 15, textColor: .white)
                    .foregroundStyle(.white)
                    .frame(width: 16, height: 16)
                    .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor1, shape: .circle)
                    .clipShape(.circle)
                    .overlay {
                        if num == selectedSection {
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        }
                    }
                    .shadow(color: .white, radius: num == selectedSection ? 5 : 0)
                    .onTapGesture {
                        withAnimation {
                            selectedSection = num
                        }
                    }
            }
        }
    }
}

#Preview {
    LeftNavigationButtonsView(selectedSection: .constant(1))
}
