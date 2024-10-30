//
//  AnimatedStarryBackgroundView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import SwiftUI

struct AnimatedStarryBackgroundView: View {
    @State private var stars: [(CGPoint, Double)] = []
    
    var body: some View {
        GeometryReader { geometry in
            Canvas { context, size in
                for (position, brightness) in stars {
                    let color = Color.white.opacity(brightness)
                    context.fill(
                        Path(ellipseIn: CGRect(x: position.x, y: position.y, width: 2, height: 2)),
                        with: .color(color))
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black, Color.blue, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea()
            .onAppear {
                let screenWidth = geometry.size.width
                let screenHeight = geometry.size.height
                
                stars = (0..<100).map { _ in
                    (
                        CGPoint(
                            x: CGFloat.random(in: 0...screenWidth),
                            y: CGFloat.random(in: 0...screenHeight)
                        ),
                        Double.random(in: 0.5...1.0)
                    )
                }
            }
        }
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
            stars = stars.map { star in
                let newBrightness = Double.random(in: 0.5...1.0)
                return (star.0, newBrightness)
            }
        }
    }
}

#Preview {
    AnimatedStarryBackgroundView()
}
