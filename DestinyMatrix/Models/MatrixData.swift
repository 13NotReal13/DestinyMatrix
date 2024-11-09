//
//  MatrixData.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/11/2024.
//

import Foundation

typealias ArkanDictionary = [Int: ArkanInfo]

struct MatrixData {
    var lifeNumbers: LifeNumbers
    var karmicKnots: ArkanCategory
    var resourcesAndTalents: ArkanCategory
    var emotionalAndPersonalTraits: ArkanCategory
    var areasOfInfluenceAndDevelopment: ArkanCategory
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

struct ArkanInfo {
    let title: String
    let shortDescription: String
    let mainDescription: String
    
    let positiveEnergyTitle: String = "Энергия в плюсе:"
    private let positiveEnergyText: String
    var positiveEnergy: String {
        "Когда ваша энергия наполнена силой: \(positiveEnergyText)"
    }

    let negativeEnergyTitle: String = "Энергия в минусе:"
    private let negativeEnergyText: String
    var negativeEnergy: String {
        "Когда ваша энергия ослабевает: \(negativeEnergyText)"
    }
    
    let adviceTitle: String = "Советы для восстановления энергии:"
    private let adviceText: String
    var advice: String {
        "Чтобы гармонизировать вашу энергию: \(adviceText)"
    }
    
    init(title: String, shortDescription: String, mainDescription: String, positiveEnergyText: String, negativeEnergyText: String, adviceText: String) {
        self.title = title
        self.shortDescription = shortDescription
        self.mainDescription = mainDescription
        self.positiveEnergyText = positiveEnergyText
        self.negativeEnergyText = negativeEnergyText
        self.adviceText = adviceText
    }
}
