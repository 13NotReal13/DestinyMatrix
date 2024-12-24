//
//  CustomSpacerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct CustomSpacerView: View {
    let height: CGFloat
    
    var body: some View {
        VStack {}.frame(height: UIScreen.main.bounds.height * height)
    }
}
