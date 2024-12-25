//
//  HomeViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import Foundation
import SwiftUI

enum CustomFont: String {
    case blackcraft = "Blackcraft"
    case fontName = "CorrectionBrush" // main
    case inkverse = "Inkverse"
}

enum ShapeOfSphere: String {
    case shapeName = "Shape9" // main
    case shape10 = "Shape10"
    case shape11 = "Shape11"
}

final class HomeViewModel: ObservableObject {
    @Published var showHelpInfoView: Bool = false
    @Published var showHistoryView: Bool = false
    @Published var showMatrixView: Bool = false
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
        UIApplication.shared.registerForRemoteNotifications()
    }
}
