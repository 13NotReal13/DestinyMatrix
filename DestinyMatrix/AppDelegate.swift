//
//  AppDelegate.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 21/12/2024.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseMessaging

import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    // Инициализация Firebase
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        Analytics.setAnalyticsCollectionEnabled(true)
        
        // Настройка уведомлений
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
        
        return true
    }
    
    // Регистрация токена APNs
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    // Обработка входящих уведомлений в активном состоянии
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    // Обновление FCM-токена
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("FCM Token: \(fcmToken ?? "")")
    }
}
