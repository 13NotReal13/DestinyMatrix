//
//  TitleWithDatesView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import SwiftUI

struct TitleWithDatesView: View {
    var customFont: CustomFont
    
    var body: some View {
        VStack {
            HStack {
                Text("30")
                    .customText(fontSize: 40)
    
                Spacer()
                
                Text("10")
                    .customText(fontSize: 40)
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "hourglass")
                    .customText(fontSize: 40)
                
                Spacer()
                
                Image(systemName: "sunrise")
                    .customText(fontSize: 40)
            }
        }
        .padding(UIScreen.main.bounds.width * 0.05)
    }
}

#Preview {
    TitleWithDatesView(customFont: CustomFont.correctionBrush)
}
