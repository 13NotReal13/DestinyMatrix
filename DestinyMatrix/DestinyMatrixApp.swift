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
            ZStack {
                HomeView()
                    .environmentObject(audioVisualizer)
                
                // Preload keyboard
                PreloadKeyboardView()
                    .frame(width: 0, height: 0)
                    .opacity(0)
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
