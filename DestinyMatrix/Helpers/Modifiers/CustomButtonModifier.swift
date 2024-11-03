//
//  CustomButtonModifier.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

enum TypeShape {
    case capsule
    case circle
}

struct CustomButtonStyleModifier: ViewModifier {
    var color1: Color
    var color2: Color
    var shape: TypeShape

    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                LinearGradient(
                    colors: [color1, color2],
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .overlay(
                Group {
                    if shape == .capsule {
                        Capsule().stroke(Color.white, lineWidth: 2)
                    } else {
                        Circle().stroke(Color.white, lineWidth: 2)
                    }
                }
            )
            .modifier(ConditionalClipShape(shape: shape))
    }
}

struct ConditionalClipShape: ViewModifier {
    var shape: TypeShape

    func body(content: Content) -> some View {
        if shape == .capsule {
            content.clipShape(Capsule())
        } else {
            content.clipShape(Circle())
        }
    }
}
