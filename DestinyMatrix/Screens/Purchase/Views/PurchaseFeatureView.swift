//
//  PurchaseFeatureView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/01/2025.
//

import SwiftUI

struct PurchaseFeatureView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(description)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    PurchaseFeatureView(
        title: "Рекомендации и советы",
        description: "Обширные категории, включая судьбу, здоровье, деньги, карма, отношения и многое другое. Обширные категории, включая судьбу, здоровье, деньги, карма, отношения и многое другое."
    )
    .preferredColorScheme(.dark)
}
