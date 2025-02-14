//
//  CustomShadowModifier.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import Foundation
import SwiftUI

struct CustomShadowModifier: ViewModifier {
    var fontSize: CGFloat
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(CustomFont.fontName.rawValue, size: fontSize))
            .foregroundStyle(textColor)
            .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0)
    }
}
