//
//  AudioVisualizer.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import AVFoundation
import SwiftUI

final class AudioVisualizer: ObservableObject {
    @Published var amplitudes: [CGFloat] = Array(repeating: 0.5, count: 120)
    
    private let audioEngine = AVAudioEngine()
    private let playerNode = AVAudioPlayerNode()
    private let backgroundPlayerNode = AVAudioPlayerNode()
    
    init() {
        setupAudioEngine()
    }
    
    private func setupAudioEngine() {
        audioEngine.attach(playerNode)
        audioEngine.attach(backgroundPlayerNode)
        
        let format = audioEngine.mainMixerNode.outputFormat(forBus: 0)
        audioEngine.connect(playerNode, to: audioEngine.mainMixerNode, format: format)
        audioEngine.connect(backgroundPlayerNode, to: audioEngine.mainMixerNode, format: format)
        
        // Установка tap на mainMixerNode для визуализации амплитуд
        audioEngine.mainMixerNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
            self.updateAmplitudes(buffer: buffer)
        }
        
        do {
            try audioEngine.start()
        } catch {
            print("Ошибка запуска аудио движка: \(error.localizedDescription)")
        }
    }
    
    func playAudio(url: URL, completion: @escaping () -> Void) {
        do {
            let file = try AVAudioFile(forReading: url)
            playerNode.scheduleFile(file, at: nil) {
                DispatchQueue.main.async {
                    completion()
                }
            }
            playerNode.volume = 1.0
            playerNode.play()
        } catch {
            print("Ошибка при загрузке аудиофайла: \(error.localizedDescription)")
        }
    }
    
    func playBackgroundAudio() {
        guard let backgroundAudioUrl = Bundle.main.url(forResource: "BackgroundMusic", withExtension: "mp3") else {
            print("Фоновая музыка не найдена.")
            return
        }
        
        do {
            let backgroundFile = try AVAudioFile(forReading: backgroundAudioUrl)
            backgroundPlayerNode.scheduleFile(backgroundFile, at: nil)
            backgroundPlayerNode.volume = 0.2 // Уровень громкости для фоновой музыки
            backgroundPlayerNode.play()
        } catch {
            print("Ошибка при загрузке фоновой музыки: \(error.localizedDescription)")
        }
    }
    
    func stop() {
        playerNode.stop()
//        backgroundPlayerNode.stop()
        audioEngine.stop()
        audioEngine.mainMixerNode.removeTap(onBus: 0)
    }
    
    private func updateAmplitudes(buffer: AVAudioPCMBuffer) {
        guard let channelData = buffer.floatChannelData else { return }
        
        let channelDataArray = Array(UnsafeBufferPointer(start: channelData[0], count: Int(buffer.frameLength)))
        
        // Преобразуем значения в амплитуды для визуализации
        let amplitude = channelDataArray.map { abs($0) }.max() ?? 0.0
        let scaledAmplitude = CGFloat(amplitude) * 4 // Увеличиваем коэффициент для видимого эффекта
        
        DispatchQueue.main.async {
            self.amplitudes = self.amplitudes.map { _ in
                CGFloat.random(in: scaledAmplitude * 0.5...scaledAmplitude)
            }
        }
    }
}
