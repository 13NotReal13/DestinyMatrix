//
//  MatrixViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/12/2024.
//

import Foundation

final class MatrixViewModel: ObservableObject {
    @Published var selectedSection = 1
    @Published var selectedSectionForLeftButtons = 1
    @Published var isMenuOpen = false
    @Published var showShareSheet: Bool = false
    
    @Published var shareItems: [Any] = []
    
    func generatePDF(matrixData: MatrixData) {
        let pdfManager = PDFManager()
        if let pdfURL = pdfManager.savePDF(matrixData: matrixData) {
            DispatchQueue.main.async {
                self.showShareSheet = true
                self.shareItems = [pdfURL]
            }
        } else {
            print("Не удалось создать PDF")
        }
    }
}
