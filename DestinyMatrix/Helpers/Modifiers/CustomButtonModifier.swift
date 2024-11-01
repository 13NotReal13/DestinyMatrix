//
//  CustomButtonModifier.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import Foundation
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
        let overlayShape: AnyView = {
            if shape == .capsule {
                return AnyView(Capsule().stroke(Color.white, lineWidth: 2))
            } else {
                return AnyView(Circle().stroke(Color.white, lineWidth: 2))
            }
        }()

        let clipShape: AnyShape = {
            if shape == .capsule {
                return AnyShape(Capsule())
            } else {
                return AnyShape(Circle())
            }
        }()

        return content
            .padding()
            .background(
                LinearGradient(
                    colors: [color1, color2],
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .overlay(overlayShape)
            .clipShape(clipShape)
    }
}
