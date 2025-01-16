//
//  AnimatedStarryBackgroundView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import SwiftUI

struct AnimatedStarryBackgroundView: View {
    @State private var stars: [(CGPoint, Double)] = []
    @State private var lastSize: CGSize = .zero
    
    var body: some View {
        ZStack {
            Image(.newbackimage)
                .resizable()
            
            LinearGradient(
                stops: [
                    .init(color: .black.opacity(0.9), location: 0),
                    .init(color: .clear, location: 0.2)
                ],
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea()
            
            GeometryReader { geometry in
                Canvas { context, size in
                    for (position, brightness) in stars {
                        let color = Color.white.opacity(brightness)
                        context.fill(
                            Path(ellipseIn: CGRect(x: position.x, y: position.y, width: 2, height: 2)),
                            with: .color(color))
                    }
                }
                .ignoresSafeArea()
                .onAppear {
                    generateStars(in: geometry.size)
                }
                .onChange(of: geometry.size) { newSize in
                    if newSize != lastSize {
                        lastSize = newSize
                        generateStars(in: newSize)
                    }
                }
            }
            .ignoresSafeArea()
            .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
                stars = stars.map { star in
                    let newBrightness = Double.random(in: 0.5...1.0)
                    return (star.0, newBrightness)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private func generateStars(in size: CGSize) {
        let screenWidth = size.width
        let screenHeight = size.height
        
        stars = (0..<50).map { _ in
            (
                CGPoint(
                    x: CGFloat.random(in: 0...screenWidth),
                    y: CGFloat.random(in: 0...screenHeight * 0.65)
                ),
                Double.random(in: 0.5...1.0)
            )
        }
    }
}

#Preview {
    AnimatedStarryBackgroundView()
}
