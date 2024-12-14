//
//  StorageManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/11/2024.
//

import Foundation
import SwiftUI

struct ShortMatrixData: Codable {
    let name: String
    let dateOfBirthday: Date
    let dateCreationMatrix: Date
}

final class StorageManager {
    @AppStorage("historyMatrixData") var storedData: String = ""
    
    var historyMatrixData: [ShortMatrixData] {
        get {
            guard let data = storedData.data(using: .utf8) else { return [] }
            let decodedData = try? JSONDecoder().decode([ShortMatrixData].self, from: data)
            return decodedData ?? []
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                storedData = String(data: encodedData, encoding: .utf8) ?? ""
            }
        }
    }
    
    func add(shortMatrixData: ShortMatrixData) {
        var currentData = historyMatrixData
        currentData.append(shortMatrixData)
    }
}
