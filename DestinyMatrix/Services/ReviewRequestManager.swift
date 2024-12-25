//
//  ReviewRequestManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 25/12/2024.
//

import SwiftUI
import StoreKit
import MessageUI

final class ReviewRequestManager: NSObject, ObservableObject, MFMailComposeViewControllerDelegate {
    
    static let shared = ReviewRequestManager()
    private override init() {}
    
    @AppStorage("hasSeenReviewPrompt") private var hasSeenReviewPrompt: Bool = false
    @AppStorage("viewedLastSection") private var viewedLastSection: Bool = false
    
    private let minMatricesCount = 2
    private let minUsageTime: TimeInterval = 900 // 15 минут (900 секунд)
    
    func reviewPromptWasShowing() -> Bool {
        return hasSeenReviewPrompt
    }
    
    func checkReviewConditions(
        matricesCount: Int,
        totalTime: TimeInterval,
        currentSection: Int
    ) {
        guard !hasSeenReviewPrompt else { return }
        
        if currentSection == 13 {
            viewedLastSection = true
        }
     
        if matricesCount >= minMatricesCount || (viewedLastSection && totalTime >= minUsageTime) {
            showFeedbackAlert()
        }
    }
    
    private func requestReview() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
            hasSeenReviewPrompt = true
        }
    }
    
    private func showFeedbackAlert() {
        let alert = UIAlertController(
            title: "Насколько полезно это приложение?",
            message: "Вы довольны расчётом матрицы? Нашли это приложение полезным?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in
            self.requestReview()
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { _ in
            self.hasSeenReviewPrompt = true
            self.showFeedbackForm() // Переход к форме обратной связи
        }))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first?.rootViewController {
            rootVC.present(alert, animated: true)
        }
    }
    
    // Форма обратной связи
    private func showFeedbackForm() {
        // Проверяем, доступна ли почта на устройстве
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["i.semikin.94@icloud.com"]) // Замените на реальный email
            mail.setSubject("Обратная связь из приложения - Матрица Судьбы")
            mail.setMessageBody("Опишите вашу проблему или предложение здесь...", isHTML: false)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first?.rootViewController {
                rootVC.present(mail, animated: true)
            }
        } else {
            // Если почта недоступна
            let alert = UIAlertController(
                title: "Почта недоступна",
                message: "На устройстве не настроен почтовый клиент. Вы можете написать нам на i.semikin.94@icloud.com",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Ок", style: .default))
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first?.rootViewController {
                rootVC.present(alert, animated: true)
            }
        }
    }
    
    // Закрытие почтового клиента
    func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        controller.dismiss(animated: true, completion: nil)
    }
}
