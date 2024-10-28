//
//  CircularEqualizerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct CircularEqualizerView: View {
    @State private var amplitudes: [CGFloat] = Array(repeating: 1.0, count: 30)
    
    var body: some View {
        ZStack {
            ForEach(0..<amplitudes.count, id: \.self) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.yellow)
                    .frame(width: 4, height: amplitudes[i] * 100)
                    .offset(y: -150)
                    .rotationEffect(.degrees(Double(i) / Double(amplitudes.count) * 360))
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.05).repeatForever(autoreverses: true)) {
                updateAmplitudes()
            }
        }
    }
    
    private func updateAmplitudes() {
        for i in amplitudes.indices {
            amplitudes[i] = CGFloat.random(in: 0.5...1.5)
        }
    }
}

#Preview {
    CircularEqualizerView()
}
