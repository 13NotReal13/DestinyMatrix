//
//  MatrixData.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 02/12/2024.
//

import Foundation

struct MatrixData: Hashable {
    var name: String
    var dateOfBirthday: Date
    
    var destinyNumber: ArkanInfo // Число Судьбы
    var lifePath: ArkanInfo // Жизненный Путь
    var relationships: ArkanInfo // Отношения
    var finances: ArkanInfo // Деньги и Финансы
    var career: ArkanInfo // Карьера и Профессия
    var health: ArkanInfo // Здоровье
    var talents: ArkanInfo // Таланты и Способности
    var challenges: ArkanInfo // Испытания и Препятствия
    var personalGrowth: ArkanInfo // Личностный Рост
    var innerSelf: ArkanInfo // Внутренний Мир
    var purpose: ArkanInfo // Предназначение
    var karmicLessons: ArkanInfo // Кармические Уроки
    var futureProspects: ArkanInfo // Будущее
    
    var allArkans: [ArkanInfo] {
        return [
            destinyNumber,
            lifePath,
            relationships,
            finances,
            career,
            health,
            talents,
            challenges,
            personalGrowth,
            innerSelf,
            purpose,
            karmicLessons,
            futureProspects
        ]
    }
    
    var arkanNumbers: [Int] {
        return allArkans.map { $0.arkanNumber }
    }
}

typealias ArkanDictionary = [Int: ArkanInfo]

struct ArkanInfo: Hashable {
    let arkanNumber: Int
    let title: String
    let subcategories: [Subcategory]
}

struct Subcategory: Hashable {
    let title: String
    let shortDescription: String
    var mainDescription: String = ""
}

