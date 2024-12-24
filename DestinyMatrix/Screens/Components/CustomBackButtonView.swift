//
//  CustomBackButtonView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct CustomBackButtonView: View {
    let dismiss: () -> Void
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .customText(fontSize: 17, textColor: .white)
        }
    }
}
