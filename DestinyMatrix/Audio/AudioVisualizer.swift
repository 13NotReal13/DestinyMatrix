//
//  AudioVisualizer.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import AVFoundation

final class AudioVisualizer {
    let audioEngine = AVAudioEngine()
    let playerNode = AVAudioPlayerNode()
    
    func start() {
        audioEngine.attach(playerNode)
        let format = audioEngine.outputNode.outputFormat(forBus: 0)
        audioEngine.connect(playerNode, to: audioEngine.outputNode, format: format)
        try? audioEngine.start()
    }
    
    func playAudio(url: URL) {
        let file = try! AVAudioFile(forReading: url)
        playerNode.scheduleFile(file, at: nil)
        playerNode.play()
    }
}
