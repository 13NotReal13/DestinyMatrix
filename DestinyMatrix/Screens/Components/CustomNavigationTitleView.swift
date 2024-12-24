//
//  CustomNavigationTitleView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct CustomNavigationTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .customText(fontSize: 28, textColor: .white)
    }
}
