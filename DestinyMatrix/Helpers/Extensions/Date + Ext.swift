//
//  Date + Ext.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/11/2024.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ru")
        
        return formatter.string(from: self)
    }
}
