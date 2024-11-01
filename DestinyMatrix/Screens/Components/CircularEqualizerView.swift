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
    let color: Color
    let shadowColor: Color
    let offsetDistance: CGFloat
    
    var body: some View {
        ZStack {
            ForEach(0..<amplitudes.count, id: \.self) { i in
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(color)
                    .frame(width: 2, height: amplitudes[i] * maxAmplitude + 10)
                    .offset(y: offsetDistance)
                    .shadow(color: shadowColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    .rotationEffect(.degrees(Double(i) / Double(amplitudes.count) * 360))
                    .animation(
                        .easeInOut(duration: 0.2)
                        .delay(Double(i) * 0.001), value: amplitudes[i]
                    )
            }
        }
    }
}

#Preview {
    CircularEqualizerView(amplitudes: [CGFloat(30)], color: Color.yellow, shadowColor: Color.white, offsetDistance: CGFloat(-150))
}
