//
//  AudioVisualizer.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import AVFoundation
import SwiftUI

final class AudioVisualizer: ObservableObject {
    private let audioEngine = AVAudioEngine()
    private let playerNode = AVAudioPlayerNode()
    @Published var amplitudes: [CGFloat] = Array(repeating: 0.5, count: 130)
    
    func start() {
        audioEngine.attach(playerNode)
        
        // Подключение playerNode к outputNode
        let format = audioEngine.mainMixerNode.outputFormat(forBus: 0)
        audioEngine.connect(playerNode, to: audioEngine.mainMixerNode, format: format)
        
        // Установка обработчика для playerNode, чтобы получать аудиоданные
        let bufferSize: AVAudioFrameCount = 1024
        audioEngine.mainMixerNode.installTap(onBus: 0, bufferSize: bufferSize, format: format) { buffer, _ in
            self.updateAmplitudes(buffer: buffer)
        }
        
        do {
            try audioEngine.start()
        } catch {
            print("Ошибка запуска аудио движка: \(error.localizedDescription)")
        }
    }
    
    func playAudio(url: URL) {
        let file = try! AVAudioFile(forReading: url)
        playerNode.scheduleFile(file, at: nil)
        playerNode.play()
    }
    
    func stop() {
        playerNode.stop()
        audioEngine.stop()
        audioEngine.mainMixerNode.removeTap(onBus: 0)
    }
    
    private func updateAmplitudes(buffer: AVAudioPCMBuffer) {
        guard let channelData = buffer.floatChannelData else { return }
        
        let channelDataArray = Array(UnsafeBufferPointer(start: channelData[0], count: Int(buffer.frameLength)))
        
        // Преобразуем значения в амплитуды, чтобы сильнее выделить изменения
        let amplitude = channelDataArray.map { abs($0) }.max() ?? 0.0
        let scaledAmplitude = CGFloat(amplitude) * 3 // Увеличиваем коэффициент для видимого эффекта
        
        DispatchQueue.main.async {
            self.amplitudes = self.amplitudes.map { _ in
                CGFloat.random(in: scaledAmplitude * 0.5...scaledAmplitude)
            }
        }
    }
}
