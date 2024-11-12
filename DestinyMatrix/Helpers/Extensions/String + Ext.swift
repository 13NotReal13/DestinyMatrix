//
//  String + Ext.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 12/11/2024.
//

import Foundation

extension String {
    var isCyrillicOnly: Bool {
        let pattern = "^[А-Яа-яЁё]+$"
        return self.range(of: pattern, options: .regularExpression) != nil
    }
}
