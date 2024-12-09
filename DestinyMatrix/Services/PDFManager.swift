//
//  PDFManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 26/11/2024.
//

import UIKit
import PDFKit

final class PDFManager {
    let pageRect = CGRect(x: 0, y: 0, width: 612, height: 792)
    let leftPadding: CGFloat = 50
    let topPadding: CGFloat = 50
    let rightPadding: CGFloat = 50
    let bottomPadding: CGFloat = 50
    
    var currentY: CGFloat = 0.0
    
    func createPDF(matrixData: MatrixData) -> Data? {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pageRect, nil)
        
        beginNewPage()
        
        // Шрифты
        let personalDataFont = UIFont.boldSystemFont(ofSize: 24)
        let titleFont = UIFont.boldSystemFont(ofSize: 18)
        let subtitleFont = UIFont.boldSystemFont(ofSize: 16)
        let shortDescriptionFont = UIFont.italicSystemFont(ofSize: 14)
        let mainDescriptionFont = UIFont.systemFont(ofSize: 14)
        
        let personalDataAttrs: [NSAttributedString.Key: Any] = [.font: personalDataFont]
        let titleAttrs: [NSAttributedString.Key: Any] = [.font: titleFont]
        let subtitleAttrs: [NSAttributedString.Key: Any] = [.font: subtitleFont]
        let shortDescriptionAttrs: [NSAttributedString.Key: Any] = [.font: shortDescriptionFont]
        let mainDescriptionAttrs: [NSAttributedString.Key: Any] = [.font: mainDescriptionFont]
        
        // Вывод персональных данных
        let personalInfoText = "\(matrixData.name) - \(matrixData.dateOfBirthday.formattedDate())"
        drawTextWithPagination(personalInfoText, attributes: personalDataAttrs)
        
        // Добавим отступ после персональных данных
        currentY += 30
        
        // Проходим по всем арканам
        for arkan in matrixData.allArkans {
            // Заголовок аркана
            drawTextWithPagination(arkan.title, attributes: titleAttrs)
            
            for subcat in arkan.subcategories {
                currentY += 20
                drawTextWithPagination(subcat.title, attributes: subtitleAttrs)
                currentY += 5
                drawTextWithPagination(subcat.shortDescription, attributes: shortDescriptionAttrs)
                currentY += 5
                drawTextWithPagination(subcat.mainDescription, attributes: mainDescriptionAttrs)
            }
            
            // Отступ между арканами
            currentY += 40
        }
        
        UIGraphicsEndPDFContext()
        return pdfData as Data
    }
    
    private func beginNewPage() {
        UIGraphicsBeginPDFPage()
        currentY = topPadding
    }
    
    private func drawTextWithPagination(_ text: String, attributes: [NSAttributedString.Key: Any]) {
        let attrString = NSAttributedString(string: text, attributes: attributes)
        let maxWidth = pageRect.width - leftPadding - rightPadding
        let textSize = attrString.boundingRect(with: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
                                               options: [.usesLineFragmentOrigin, .usesFontLeading],
                                               context: nil)
        
        // Проверяем, влезает ли текст на текущую страницу
        if currentY + textSize.height > (pageRect.height - bottomPadding) {
            beginNewPage()
        }
        
        attrString.draw(in: CGRect(x: leftPadding, y: currentY, width: maxWidth, height: textSize.height))
        currentY += textSize.height
    }
}
