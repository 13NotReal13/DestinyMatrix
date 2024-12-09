//
//  BackgroundLeftMenuView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/12/2024.
//

import SwiftUI

struct BackgroundLeftMenuView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.backgroundColor1, Color.backgroundColor2]),
            startPoint: .top,
            endPoint: .bottom
        )
        .cornerRadius(radius: 24, corners: [.topRight, .bottomRight])
        .ignoresSafeArea(edges: .vertical)
    }
}
