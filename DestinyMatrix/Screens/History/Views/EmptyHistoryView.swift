//
//  EmptyHistoryView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct EmptyHistoryView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Нет истории")
                .customText(fontSize: 17, textColor: .white)
            Spacer()
        }
    }
}
