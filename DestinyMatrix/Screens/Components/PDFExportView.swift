//
//  PDFExportView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 26/11/2024.
//

import Foundation
import SwiftUI

struct PDFExportView<Content: View>: UIViewControllerRepresentable {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    func makeUIViewController(context: Context) -> UIHostingController<Content> {
        let hostingController = UIHostingController(rootView: content)
        hostingController.view.backgroundColor = .clear
        return hostingController
    }

    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: Context) {}
    
    // Получаем UIScrollView для передачи в PDFManager
    func extractScrollView(from uiViewController: UIHostingController<Content>) -> UIScrollView? {
        return uiViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
    }
}
