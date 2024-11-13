//
//  CircularEqualizerView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct CircularEqualizerView: View {
    @EnvironmentObject private var audioVusualizer: AudioVisualizer
    
    let color: Color
    let shadowColor: Color
    let offsetDistance: CGFloat
    
    private let maxAmplitude: CGFloat = 50.0
    
    var body: some View {
        ZStack {
            ForEach(0..<audioVusualizer.amplitudes.count, id: \.self) { i in
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(color)
                    .frame(width: 2, height: audioVusualizer.amplitudes[i] * maxAmplitude + 10)
                    .offset(y: offsetDistance)
                    .shadow(color: shadowColor.opacity(0.7), radius: 5, x: 0, y: 0)
                    .rotationEffect(.degrees(Double(i) / Double(audioVusualizer.amplitudes.count) * 360))
                    .animation(
                        .easeInOut(duration: 0.2)
                        .delay(Double(i) * 0.001), value: audioVusualizer.amplitudes[i]
                    )
            }
        }
    }
}

#Preview {
    CircularEqualizerView(color: Color.yellow, shadowColor: Color.white, offsetDistance: CGFloat(-150))
        .environmentObject(AudioVisualizer())
}
