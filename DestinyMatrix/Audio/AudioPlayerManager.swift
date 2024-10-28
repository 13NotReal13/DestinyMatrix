//
//  AudioManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import Foundation
import AVFoundation

final class AudioPlayerManager: ObservableObject {
    var player: AVAudioPlayer?
    
    func playAudio(named fileName: String, withExtension fileExtension: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Ошибка воспроизведения аудио: \(error.localizedDescription)")
            }
        }
    }
    
    func stopAudio() {
        player?.stop()
    }
}
