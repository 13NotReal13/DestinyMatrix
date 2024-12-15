//
//  PreloadMatrixDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 10/12/2024.
//

import SwiftUI

struct PreloadMatrixDataView: View {
    @EnvironmentObject private var audioVisualizer: AudioVisualizer
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    @State private var progress: CGFloat = 0.0
    @State private var statusText: String = "Считаю вашу матрицу судьбы..."
    @State private var showButton: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                 Text(statusText)
                    .customText(fontSize: 16, textColor: .white)
                    .padding(.vertical)

                 // Прогресс-бар
                 ProgressView(value: progress, total: 1.0)
                    .tint(.buttonColor2)
             }
            .padding()
            
            Spacer()
            
            VStack {
                Button {
                    homeViewModel.showMatrixView = true
                } label: {
                    Text("Открыть")
                        .frame(maxWidth: .infinity)
                        .customText(fontSize: 16, textColor: .white)
                        .customButtonStyle(shape: .capsule)
                }
                
                // TODO: Set 1 : 0 finally
                .opacity(showButton ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: showButton)
            }
            .frame(height: UIScreen.main.bounds.height * 0.1)
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
        .onAppear {
            // TODO: Open this code finally
            simulateLoadingProgress()
        }
    }
    
    /// Имитация загрузки прогресса
    private func simulateLoadingProgress() {
        progress = 0.0
        let totalDuration: TimeInterval = 25.0 // Общее время 27 секунд
        let steps = Int.random(in: 15...30) // Случайное количество шагов
        let delays = generateRandomDelays(totalDuration: totalDuration, steps: steps)
        
        for (index, delay) in delays.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                // Прогресс напрямую рассчитывается на основе текущей задержки
                let preciseProgress = CGFloat(delay / totalDuration)
                withAnimation(.easeInOut(duration: 0.5)) {
                    progress = preciseProgress
                }
                
                if index == delays.count - 1 { // Последний шаг
                    homeViewModel.preloadAudioIsFinished = true
                    statusText = "Готово! Анализ завершён." // Меняем текст
                    
                    withAnimation {
                        showButton = true
                    }
                }
            }
        }
    }
    
    /// Генерация случайных задержек для неравномерного прогресса
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
        
        // Гарантируем, что последний шаг достигает totalDuration
        if let lastIndex = delays.indices.last {
            delays[lastIndex] = totalDuration
        }
        
        return delays
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        PreloadMatrixDataView()
            .environmentObject(AudioVisualizer())
            .environmentObject(HomeViewModel())
    }
}
