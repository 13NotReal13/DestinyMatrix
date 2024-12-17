//
//  StorageManager.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 14/11/2024.
//

import Foundation
import SwiftUI

struct ShortMatrixData: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let dateOfBirthday: Date
    let dateCreationMatrix: Date
}

final class StorageManager: ObservableObject {
    @AppStorage("historyMatrixData") private var storedData: String = ""

    @Published var historyMatrixData: [ShortMatrixData] = []
    
    init() {
        load()
    }
    
    private func load() {
        guard let data = storedData.data(using: .utf8),
              let decodedData = try? JSONDecoder().decode([ShortMatrixData].self, from: data)
        else {
            historyMatrixData = []
            return
        }
        historyMatrixData = decodedData
    }
    
    private func save() {
        if let encodedData = try? JSONEncoder().encode(historyMatrixData) {
            storedData = String(data: encodedData, encoding: .utf8) ?? ""
        }
    }
    
    func add(shortMatrixData: ShortMatrixData) {
        historyMatrixData.append(shortMatrixData)
        save()
    }
    
    func delete(shortMatrixData: ShortMatrixData) {
        historyMatrixData.removeAll { $0.id == shortMatrixData.id }
        save()
    }
}
