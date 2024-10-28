//
//  Onboarding.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var audioManager = AudioPlayerManager()
    
    var body: some View {
        ZStack {
            Image(.background)
                .scaledToFill()
                .ignoresSafeArea()
            
            ZStack {
                CircularEqualizerView()
                    .frame(width: 300, height: 300)
                
                Rotating3DSphereView()
                    .frame(width: 250, height: 250)
            }
            
            Spacer()
            
            Button {
                audioManager.playAudio(named: "LilyOnboarding", withExtension: ".mp3")
            } label: {
                Text("Начать")
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
    }
}

#Preview {
    Onboarding()
}
