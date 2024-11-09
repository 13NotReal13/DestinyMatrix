//
//  MatrixData.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/11/2024.
//

import Foundation

struct MatrixData {
    var lifeNumbers: LifeNumbers
    var karmicKnots: ArkanCategory
    var resourcesAndTalents: ArkanCategory
    var emotionalAndPersonalTraits: ArkanCategory
    var professionsAndRolesData: ArkanCategory
    var recommendations: ArkanCategory
    var energyFlows: ArkanCategory
}

struct LifeNumbers {
    let сategoryTitle: String = "Жизненные Числа"
    var destinyNumber: ArkanCategory
    var lifePathNumber: ArkanCategory
    var soulNumber: ArkanCategory
    var karmaNumber: ArkanCategory
    var personalityNumber: ArkanCategory
}

struct ArkanCategory {
    var сategoryTitle: String
    var arkanInfo: ArkanDictionary
}

typealias ArkanDictionary = [Int: ArkanInfo]

struct ArkanInfo {
    let shortDescription: String
    let mainDescription: String
    
    let positiveEnergyTitle: String = "Энергия в плюсе:"
    let positiveEnergyText: String

    let negativeEnergyTitle: String = "Энергия в минусе:"
    let negativeEnergyText: String
    
    let adviceTitle: String = "Советы для восстановления энергии:"
    let adviceText: String
}
