//
//  PDFManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 26/11/2024.
//

import Foundation
import UIKit

final class PDFManager {
    static let shared = PDFManager()
    
    private init() {}
    
    func createPDF(from scrollView: UIScrollView) -> Data? {
        let originalFrame = scrollView.frame
        
        let contentSize = scrollView.contentSize
        scrollView.frame = CGRect(origin: .zero, size: contentSize)
        
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(origin: .zero, size: contentSize), nil)
        UIGraphicsBeginPDFPage()
        
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return nil }
        scrollView.layer.render(in: pdfContext)
        
        UIGraphicsEndPDFContext()
        
        scrollView.frame = originalFrame
        return pdfData as Data
    }
    
    func savePDF(name: String, dateOfBirthday: String, data: Data) -> URL? {
        let fileName = "\(name)-\(dateOfBirthday).pdf"
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsURL.appendingPathComponent(fileName, conformingTo: .pdf)
        
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Ошибка при сохранении PDF: \(error)")
            return nil
        }
    }
    
    func sharePDF(from fileURL: URL, in viewController: UIViewController) {
        let activityViewController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        viewController.present(activityViewController, animated: true, completion: nil)
    }
    
    func exportScrollViewToPDF(name: String, dateOfBirthday: String, scrollView: UIScrollView, viewController: UIViewController) {

        guard let pdfData = createPDF(from: scrollView) else {
            print("Не удалось создать PDF")
            return
        }

        guard let fileURL = savePDF(
            name: name,
            dateOfBirthday: dateOfBirthday,
            data: pdfData
        ) else {
            print("Ошибка при сохранении PDF")
            return
        }

        sharePDF(from: fileURL, in: viewController)
    }
}
