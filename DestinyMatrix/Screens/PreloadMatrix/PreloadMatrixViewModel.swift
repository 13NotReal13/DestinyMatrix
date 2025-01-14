//
//  PreloadMatrixViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import Foundation
import SwiftUI

final class PreloadMatrixViewModel: ObservableObject {
    @Published var progress: CGFloat = 0.0
    @Published var statusText: String = "Анализирую вашу матрицу..."
    @Published var showPurchaseModal: Bool = false
    
    private var totalDuration: TimeInterval = 25.0
    
    // Начинает загрузку прогресса
    func startLoading() {
        progress = 0.0
        let steps = Int.random(in: 15...30)
        let delays = generateRandomDelays(totalDuration: totalDuration, steps: steps)
        
        for (index, delay) in delays.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                let preciseProgress = CGFloat(delay / self.totalDuration)
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.progress = preciseProgress
                }
                
                if index == delays.count - 1 {
                    self.showPurchaseModal = true
                }
            }
        }
    }
    
    // Генерация случайных задержек для анимации прогресса
    private func generateRandomDelays(totalDuration: TimeInterval, steps: Int) -> [TimeInterval] {
        var delays: [TimeInterval] = []
        var accumulatedTime: TimeInterval = 0.0
        
        for i in 0..<steps {
            let remainingSteps = steps - i
            let remainingTime = totalDuration - accumulatedTime
            let stepDelay = Double.random(in: 0.1...(remainingTime / Double(remainingSteps)))
            
            accumulatedTime += stepDelay
            delays.append(accumulatedTime)
        }
        
        if let lastIndex = delays.indices.last {
            delays[lastIndex] = totalDuration
        }
        
        return delays
    }
}
