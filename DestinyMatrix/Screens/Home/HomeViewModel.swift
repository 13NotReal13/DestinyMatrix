//
//  HomeViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 30/10/2024.
//

import Foundation
import SwiftUI

enum CustomFont: String {
    case fontName = "CorrectionBrush"
}

enum ShapeOfSphere: String {
    case shapeName = "Shape9"
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
