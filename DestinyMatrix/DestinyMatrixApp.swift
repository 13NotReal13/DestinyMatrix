//
//  DestinyMatrixApp.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 27/10/2024.
//

import SwiftUI

@main
struct DestinyMatrixApp: App {
    @StateObject private var audioVisualizer = AudioVisualizer()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(audioVisualizer)
        }
    }
}
