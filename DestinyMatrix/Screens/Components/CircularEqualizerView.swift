//
//  CircularEqualizerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct CircularEqualizerView: View {
    let amplitudes: [CGFloat]
    let maxAmplitude: CGFloat = 50.0
    
    var body: some View {
        ZStack {
            ForEach(0..<amplitudes.count, id: \.self) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.yellow)
                    .frame(width: 4, height: amplitudes[i] * maxAmplitude)
                    .offset(y: -150)
                    .rotationEffect(.degrees(Double(i) / Double(amplitudes.count) * 360))
            }
        }
    }
}

#Preview {
    CircularEqualizerView(amplitudes: [CGFloat(30)])
}
