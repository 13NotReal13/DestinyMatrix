//
//  DestinyMatrixApp.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 27/10/2024.
//

import SwiftUI

@main
struct DestinyMatrixApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var audioVisualizer = AudioVisualizer()
    @StateObject private var storageManager = StorageManager()
    @AppStorage("onboardingWasShowing") private var onboardingWasShowing: Bool = false

    // Для отслеживания времени работы
    @AppStorage("totalAppTime") private var totalAppTime: Double = 0.0
    @State private var startTime: Date?

    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if onboardingWasShowing {
                    HomeView()
                        .environmentObject(audioVisualizer)
                        .preferredColorScheme(.dark)
                } else {
                    OnboardingView()
                        .environmentObject(audioVisualizer)
                        .preferredColorScheme(.dark)
                }
                
                // Preload keyboard
                PreloadKeyboardView()
                    .frame(width: 0, height: 0)
                    .opacity(0)
            }
            .onAppear {
                audioVisualizer.playBackgroundAudio()
                FirebaseLogManager.shared.logDeviceInfoOnce()
            }
            .onChange(of: scenePhase) { phase in
                switch phase {
                case .active:
                    startTime = Date() // Начало сессии
                case .inactive, .background:
                    if let startTime = startTime {
                        let sessionDuration = Date().timeIntervalSince(startTime)
                        totalAppTime += sessionDuration
//                        print("Session duration: \(sessionDuration)")
//                        print("Total time: \(totalAppTime)")
                    }
                @unknown default:
                    break
                }
            }
        }
    }
}

struct PreloadKeyboardView: UIViewRepresentable {
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.isHidden = true

        // Получаем текущее окно через UIWindowScene
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.addSubview(textField) // Добавляем на главное окно
        }
        
        textField.becomeFirstResponder() // Вызываем клавиатуру
        
        // Закрываем клавиатуру после короткой задержки
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            textField.resignFirstResponder() // Скрываем клавиатуру
            textField.removeFromSuperview() // Удаляем временное поле
        }
        
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {}
}
