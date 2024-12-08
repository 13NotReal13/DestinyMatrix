//
//  MatrixDataNew.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 02/12/2024.
//

import Foundation

struct MatrixDataNew: Hashable {
    var name: String
    var dateOfBirthday: Date
    var dateCreationMatrix: Date
    
    var destinyNumber: ArkanInfoNew // Число Судьбы
    var lifePath: ArkanInfoNew // Жизненный Путь
    var relationships: ArkanInfoNew // Отношения
    var finances: ArkanInfoNew // Деньги и Финансы
    var career: ArkanInfoNew // Карьера и Профессия
    var health: ArkanInfoNew // Здоровье
    var talents: ArkanInfoNew // Таланты и Способности
    var challenges: ArkanInfoNew // Испытания и Препятствия
    var personalGrowth: ArkanInfoNew // Личностный Рост
    var innerSelf: ArkanInfoNew // Внутренний Мир
    var purpose: ArkanInfoNew // Предназначение
    var karmicLessons: ArkanInfoNew // Кармические Уроки
    var futureProspects: ArkanInfoNew // Будущее
}

typealias ArkanDictionaryNew = [Int: ArkanInfoNew]

struct ArkanInfoNew: Hashable {
    let arkanNumber: Int = 0
    let title: String
    let subcategories: [Subcategory]
}

struct Subcategory: Hashable {
    let title: String
    let shortDescription: String
    var mainDescription: String = ""
}

