//
//  FirebaseLogManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 26/12/2024.
//

import FirebaseAnalytics
import Foundation

final class FirebaseLogManager {
    static let shared = FirebaseLogManager()
    
    private init() {}
    
    // MARK: - Названия событий
    private enum EventNames {
        // Основные логи
        static let deviceInfo = "TEST_device_info"
        static let screenView = "TEST_screen_view"
        static let appError = "TEST_app_error"
        static let matrixCalculated = "TEST_matrix_calculated"
        static let sharePDF = "TEST_share_PDF_file"
        
        // Логи для отзывов
        static let reviewPromptShown = "TEST_review_prompt_shown"
        static let reviewPromptAccepted = "TEST_review_prompt_accepted"
        static let reviewPromptDeclined = "TEST_review_prompt_declined"
        
        // Логи для обратной связи
        static let feedbackFormOpened = "TEST_feedback_form_opened"
        static let feedbackSubmitted = "TEST_feedback_submitted"
        static let feedbackError = "TEST_feedback_error"
        
        // Логи для покупок
        static let purchaseStart = "TEST_purchase_start"
        static let purchaseSuccess = "TEST_purchase_success"
        static let purchaseFailure = "TEST_purchase_failure"
        static let purchaseRestoreSuccess = "TEST_purchase_restore_success"
        static let purchaseRestoreFailure = "TEST_purchase_restore_failure"
    }
    
    // MARK: - Логирование событий
    
    /// Лог общего события с параметрами
    func logEvent(name: String, parameters: [String: Any]? = nil) {
        Analytics.logEvent(name, parameters: parameters)
        print("[FirebaseLog] Event: \(name) Parameters: \(parameters ?? [:])")
    }
    
    // MARK: - Логи устройства
    
    /// Лог информации об устройстве (отправляется один раз)
    func logDeviceInfoOnce() {
        let hasLoggedDeviceInfo = UserDefaults.standard.bool(forKey: "hasLoggedDeviceInfo")
        guard !hasLoggedDeviceInfo else { return }
        
        let systemVersion = UIDevice.current.systemVersion // Версия iOS
        let deviceModel = UIDevice.current.model           // Модель устройства
        let deviceName = UIDevice.current.name             // Название устройства
        let locale = Locale.current.identifier             // Локализация

        logEvent(name: EventNames.deviceInfo, parameters: [
            "iOS_version": systemVersion,
            "device_model": deviceModel,
            "device_name": deviceName,
            "locale": locale
        ])
        
        UserDefaults.standard.set(true, forKey: "hasLoggedDeviceInfo")
    }
    
    /// Лог открытия экрана
    func logScreenView(screenName: String) {
        logEvent(name: EventNames.screenView, parameters: ["screen_name": screenName])
    }
    
    // MARK: - Логи покупок
    
    /// Лог начала покупки
    func logPurchaseStart(productID: String) {
        logEvent(name: EventNames.purchaseStart, parameters: ["product_id": productID])
    }
    
    /// Лог успешной покупки
    func logPurchaseSuccess(productID: String, price: String) {
        logEvent(name: EventNames.purchaseSuccess, parameters: [
            "product_id": productID,
            "price": price
        ])
    }
    
    /// Лог ошибки при покупке
    func logPurchaseFailure(productID: String, error: String?) {
        logEvent(name: EventNames.purchaseFailure, parameters: [
            "product_id": productID,
            "error": error ?? "Unknown error"
        ])
    }
    
    /// Лог успешного восстановления покупок
    func logRestoreSuccess() {
        logEvent(name: EventNames.purchaseRestoreSuccess)
    }
    
    /// Лог ошибки при восстановлении покупок
    func logRestoreFailure(error: String?) {
        logEvent(name: EventNames.purchaseRestoreFailure, parameters: [
            "error": error ?? "Unknown error"
        ])
    }
    
    // MARK: - Логи ошибок
    
    /// Логирование ошибок
    func logError(message: String, details: String? = nil) {
        logEvent(name: EventNames.appError, parameters: [
            "message": message,
            "details": details ?? "No details"
        ])
    }
    
    // MARK: - Логи матрицы
    
    /// Лог завершения рассчёта матрицы
    func logMatrixCalculated(name: String, dateOfBirth: String) {
        logEvent(name: EventNames.matrixCalculated, parameters: [
            "name": name,
            "date_of_birth": dateOfBirth
        ])
    }
    
    /// Лог отправки PDF-файла
    func logSharePDFFile() {
        logEvent(name: EventNames.sharePDF)
    }
    
    // MARK: - Логи отзывов
    
    /// Лог показа формы для отзыва
    func logReviewPromptShown() {
        logEvent(name: EventNames.reviewPromptShown)
    }
    
    /// Лог положительного ответа на отзыв
    func logReviewPromptAccepted() {
        logEvent(name: EventNames.reviewPromptAccepted)
    }
    
    /// Лог отказа от оставления отзыва
    func logReviewPromptDeclined() {
        logEvent(name: EventNames.reviewPromptDeclined)
    }
    
    // MARK: - Логи обратной связи
    
    /// Лог открытия формы обратной связи
    func logFeedbackFormOpened() {
        logEvent(name: EventNames.feedbackFormOpened)
    }
    
    /// Лог успешной отправки письма
    func logFeedbackSubmitted() {
        logEvent(name: EventNames.feedbackSubmitted)
    }
    
    /// Лог ошибки при отправке письма
    func logFeedbackError(message: String) {
        logEvent(name: EventNames.feedbackError, parameters: ["message": message])
    }
}
