//
//  View + Ext.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 31/10/2024.
//

import Foundation
import SwiftUI

extension View {
    func customText(fontSize: CGFloat) -> some View {
        self.modifier(CustomShadowModifier(fontSize: fontSize))
    }
    
    func customButtonStyle(color1: Color, color2: Color, shape: TypeShape) -> some View {
        self.modifier(CustomButtonStyleModifier(color1: color1, color2: color2, shape: shape))
    }
}
