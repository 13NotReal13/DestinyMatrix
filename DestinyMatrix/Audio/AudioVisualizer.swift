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
    @Published var isPlaying: Bool = false
    
    @State var isNeedAmplitude: Bool = false
    
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
            isPlaying = true
            playerNode.scheduleFile(file, at: nil) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        self.isPlaying = false
                        self.playerNode.stop()
                    }
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
        DispatchQueue.global(qos: .background).async {
            guard let backgroundAudioUrl = Bundle.main.url(forResource: "BackgroundMusic", withExtension: "mp3") else {
                print("Фоновая музыка не найдена.")
                return
            }
            
            do {
                let backgroundFile = try AVAudioFile(forReading: backgroundAudioUrl)
                self.backgroundPlayerNode.scheduleFile(backgroundFile, at: nil)
                self.backgroundPlayerNode.volume = 0.2 // Уровень громкости для фоновой музыки
                self.backgroundPlayerNode.play()
            } catch {
                print("Ошибка при загрузке фоновой музыки: \(error.localizedDescription)")
            }
        }
    }
    
    func stop() {
        playerNode.stop()
        audioEngine.stop()
        audioEngine.mainMixerNode.removeTap(onBus: 0)
    }
    
    private func updateAmplitudes(buffer: AVAudioPCMBuffer) {
        if playerNode.isPlaying {
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
}
