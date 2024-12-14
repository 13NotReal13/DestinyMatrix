//
//  PreloadMatrixDataViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 10/12/2024.
//

import Foundation
import SwiftUI

final class PreloadMatrixDataViewModel: ObservableObject {
    @Published var audioIsFinished: Bool = false
    @Published var matrixData: MatrixData?
    
    @Published var showMatrixView: Bool = false
    
    func startAudio(audioVisualizer: AudioVisualizer) {
        if !audioIsFinished, let audioURL = Bundle.main.url(forResource: "CharlottePreloadMatrixData", withExtension: "mp3") {
            audioVisualizer.playAudio(url: audioURL) { [weak self] in
                DispatchQueue.main.async {
                    withAnimation(.easeIn(duration: 1)) {
                        self?.audioIsFinished = true
                    }
                }
            }
        }
    }
    
    func stopAudio(audioVisualizer: AudioVisualizer) {
        audioVisualizer.stopVoice()
    }
}
