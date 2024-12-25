//
//  AudioVisualizer.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import AVFoundation
import SwiftUI

final class AudioVisualizer: ObservableObject {
    // MARK: - Published properties
    
    /// Вектор амплитуд для 120 столбцов визуализатора
    @Published var amplitudes: [CGFloat]
    
    /// Флаг, воспроизводится ли основной трек
    @Published var isPlaying: Bool = false
    
    // MARK: - Audio Engine
    
    private let audioEngine = AVAudioEngine()
    private let playerNode = AVAudioPlayerNode()
    private let backgroundPlayerNode = AVAudioPlayerNode()
    
    private var backgroundFile: AVAudioFile?
    
    // MARK: - Константы/настройки
    
    private let barsCount = 120          // кол-во столбцов визуализации
    private let amplitudeScale: CGFloat = 4.0 // масштаб амплитуды
    
    // MARK: - Init
    
    init() {
        // Изначально все амплитуды по 0.5
        self.amplitudes = Array(repeating: 0.5, count: barsCount)
        
        setupAudioSession()
        setupAudioEngine()
        prepareBackgroundAudioFile()
    }
    
    // MARK: - Public Methods
    
    /// Воспроизведение основного файла (однократно)
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
    
    /// Запускаем фоновую музыку зацикленно
    func playBackgroundAudio() {
        guard let backgroundFile = backgroundFile else { return }
        
        if backgroundPlayerNode.isPlaying {
            backgroundPlayerNode.stop()
        }
        
        backgroundPlayerNode.scheduleFile(backgroundFile, at: nil) { [weak self] in
            DispatchQueue.main.async {
                self?.playBackgroundAudio() // зацикливаем
            }
        }
        
        backgroundPlayerNode.volume = 0.2
        backgroundPlayerNode.play()
    }
    
    /// Остановить фоновую музыку вручную
    func stopBackgroundAudio() {
        if backgroundPlayerNode.isPlaying {
            backgroundPlayerNode.stop()
        }
    }
    
    // MARK: - Private Setup
    
    private func prepareBackgroundAudioFile() {
        if let backgroundAudioUrl = Bundle.main.url(forResource: "BackgroundMusic", withExtension: "mp3") {
            do {
                backgroundFile = try AVAudioFile(forReading: backgroundAudioUrl)
            } catch {
                print("Ошибка при загрузке фоновой музыки: \(error.localizedDescription)")
            }
        }
    }
    
    private func setupAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, options: [.mixWithOthers, .duckOthers])
            try session.setActive(true)
        } catch {
            print("Ошибка настройки аудиосессии: \(error)")
        }
    }
    
    private func setupAudioEngine() {
        audioEngine.attach(playerNode)
        audioEngine.attach(backgroundPlayerNode)
        
        let format = audioEngine.mainMixerNode.outputFormat(forBus: 0)
        audioEngine.connect(playerNode, to: audioEngine.mainMixerNode, format: format)
        audioEngine.connect(backgroundPlayerNode, to: audioEngine.mainMixerNode, format: format)
        
        // Устанавливаем Tap для визуализации амплитуды
        audioEngine.mainMixerNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
            self.updateAmplitudes(buffer: buffer)
        }
        
        do {
            try audioEngine.start()
        } catch {
            print("Ошибка запуска аудиодвижка: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Updating Amplitudes
    
    /// Генерируем случайные амплитуды на основе реального пика
    private func updateAmplitudes(buffer: AVAudioPCMBuffer) {
        // Если основной трек не играет, можно не обновлять амплитуды (или сбрасывать).
        guard playerNode.isPlaying else { return }
        
        guard let channelData = buffer.floatChannelData else { return }
        
        // Берём максимальный пик из первого канала (или усредняем все каналы, если нужно)
        let frameLength = Int(buffer.frameLength)
        let samples = UnsafeBufferPointer(start: channelData[0], count: frameLength)
        
        let peak = samples.map { abs($0) }.max() ?? 0.0
        
        // Увеличиваем значение для наглядности
        let scaledAmplitude = CGFloat(peak) * amplitudeScale
        
        // Заполняем каждый столбец случайным значением в диапазоне
        let newAmplitudes = amplitudes.map { _ in
            CGFloat.random(in: scaledAmplitude * 0.5...scaledAmplitude)
        }
        
        DispatchQueue.main.async {
            self.amplitudes = newAmplitudes
        }
    }
}
