//
//  View + Ext.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import Foundation
import SwiftUI

extension View {
    func customText(fontSize: CGFloat, textColor: Color) -> some View {
        self.modifier(CustomShadowModifier(fontSize: fontSize, textColor: textColor))
    }
    
    func customButtonStyle(
        color1: Color = .backgroundColor1,
        color2: Color = .backgroundColor2,
        shape: TypeShape
    ) -> some View {
        self.modifier(CustomButtonStyleModifier(color1: color1, color2: color2, shape: shape))
    }
    
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorners(radius: radius, corners: corners) )
    }
}

struct RoundedCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
