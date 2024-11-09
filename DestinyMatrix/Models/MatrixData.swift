//
//  MatrixData.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/11/2024.
//

import Foundation

typealias ArkanDictionary = [Int: ArkanInfo]

struct LifeNumbers {
    var destinyNumber: ArkanDictionary
    var lifePathNumber: ArkanDictionary
    var soulNumber: ArkanDictionary
    var karmaNumber: ArkanDictionary
    var personalityNumber: ArkanDictionary
}

struct MatrixData {
    var lifeNumbers: LifeNumbers
    var karmicKnots: ArkanDictionary
    var resourcesAndTalents: ArkanDictionary
    var emotionalAndPersonalTraits: ArkanDictionary
    var areasOfInfluenceAndDevelopment: ArkanDictionary
    var recommendations: ArkanDictionary
    var energyFlows: ArkanDictionary
}
