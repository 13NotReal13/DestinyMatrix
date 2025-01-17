//
//  BottomNavigationBarView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 15/01/2025.
//

import SwiftUI

struct BottomNavigationBarView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var audioVisualizer: AudioVisualizer
    @Binding var isRootActive: Bool
    
    var body: some View {
        VStack(spacing: 6) {
            Spacer()
            
            HStack(alignment: .bottom) {
                NavigationLink(destination: HelpInfoView()) {
                    Text("Описание")
                        .frame(width: UIScreen.main.bounds.width * 0.2)
                        .customText(fontSize: 17, textColor: .white)
                        .customButtonStyle(shape: .capsule)
                        .padding(.bottom, 16)
                }
                
                NavigationLink(
                    destination: EnterDataView()
                        .environmentObject(navigationManager),
                    isActive: $isRootActive
                ) {
                    VStack(spacing: 8) {
                        Image(systemName: "person.fill.questionmark")
                            .customText(fontSize: 34, textColor: .white)
                            .customButtonStyle(shape: .circle)
                        
                        Text("Матрица")
                            .customText(fontSize: 15, textColor: .white)
                    }
                }
        
                NavigationLink(destination: HistoryView()) {
                    Text("История")
                        .frame(width: UIScreen.main.bounds.width * 0.2)
                        .customText(fontSize: 17, textColor: .white)
                        .customButtonStyle(shape: .capsule)
                        .padding(.bottom, 16)
                }
            }
            
            HStack(spacing: 16) {
                Button {
                    ReviewRequestManager.shared.showFeedbackForm()
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "pencil.line")
                            .customText(fontSize: 17, textColor: .white)
                            .customButtonStyle(shape: .circle)
                        
                        Text("Поддержка")
                            .customText(fontSize: 15, textColor: .white)
                    }
                }
                
                Button {
                    audioVisualizer.toggleBackgroundAudio()
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "music.note")
                            .customText(fontSize: 17, textColor: .white)
                            .customButtonStyle(
                                color1: .backgroundColor1,
                                color2: audioVisualizer.isBackgroundMusicPlaying
                                ? .backgroundColor2
                                : .gray,
                                shape: .circle
                            )
                        
                        Text("Музыка")
                            .customText(fontSize: 15, textColor: .white)
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        BottomNavigationBarView(isRootActive: .constant(false))
            .environmentObject(NavigationManager())
            .environmentObject(AudioVisualizer())
    }
}
