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
}
