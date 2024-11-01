//
//  TitleWithDatesView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import SwiftUI

struct DateAround3DSphere: View {
    var customFont: CustomFont
    
    private var dayToday: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    private var monthToday: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(dayToday)
                    .customText(fontSize: 40)
    
                Spacer()
                
                Text(monthToday)
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
    DateAround3DSphere(customFont: CustomFont.correctionBrush)
}
