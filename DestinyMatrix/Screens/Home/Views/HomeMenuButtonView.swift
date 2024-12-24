//
//  HomeMenuButtonView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 23/12/2024.
//

import SwiftUI

struct HomeMenuButtonView: View {
    @State var title: String
    
    var body: some View {
        Text(title)
            .frame(width: UIScreen.main.bounds.width * 0.6)
            .customText(fontSize: 17, textColor: .white)
            .customButtonStyle(shape: .capsule)    }
}
