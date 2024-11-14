//
//  MatrixOfDestiny.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 03/11/2024.
//

import Foundation

struct MatrixCalculation {
    let name: String
    let dateOfBirthday: Date
    
    private let day: Int
    private let month: Int
    private let year: Int

    var matrixData: MatrixData {
        return MatrixData(
            name: name,
            dateOfBirthday: dateOfBirthday,
            
            lifeNumbers: LifeNumbers(
                destinyNumber: calculateDestinyNumber(),
                lifePathNumber: calculateLifePathNumber(),
                soulNumber: calculateSoulNumber(),
                karmaNumber: calculateKarmaNumber(),
                personalityNumber: calculatePersonalityNumber()
            ),
            karmicKnots: calculateKarmicKnots(),
            resourcesAndTalents: calculateResourcesAndTalents(),
            emotionalAndPersonalTraits: calculateEmotionalTraits(),
            professionsAndRolesData: calculateProfessionsAndRoles(),
            moneyFlows: calculateMoneyFlows(),
            energyFlows: calculateEnergyFlows(),
            recommendations: calculateRecommendations()
        )
    }
    
    init(name: String, dateOfBirthday: Date) {
        self.name = name
        self.dateOfBirthday = dateOfBirthday
        
        let calendar = Calendar.current
        self.day = calendar.component(.day, from: dateOfBirthday)
        self.month = calendar.component(.month, from: dateOfBirthday)
        self.year = calendar.component(.year, from: dateOfBirthday)
    }
    
    private func reduceToArkan(_ number: Int) -> Int {
        var num = number
        while num > 22 {
            num = String(num).compactMap { $0.wholeNumberValue }.reduce(0, +)
        }
        return num
    }
    
    private func calculateDestinyNumber() -> ArkanCategory {
        let sumDate = String(day) + String(month) + String(year)
        let destinyNumberValue = reduceToArkan(Int(sumDate) ?? 1)
        let arkanInfo = DestinyNumberData.allArkans[destinyNumberValue]!
        
        return ArkanCategory(сategoryTitle: "Число Судьбы", arkanInfo: arkanInfo)
    }
    
    private func calculateLifePathNumber() -> ArkanCategory {
        let lifePathNumberValue = reduceToArkan(day + month + year)
        let arkanInfo = LifePathNumberData.allArkans[lifePathNumberValue]!
        
        return ArkanCategory(сategoryTitle: "Число Жизненного Пути", arkanInfo: arkanInfo)
    }

    private func calculateSoulNumber() -> ArkanCategory {
        let nameSum = name.unicodeScalars.filter { $0.isASCII == false }.map { Int($0.value) }.reduce(0, +)
        let soulNumberValue = reduceToArkan(nameSum)
        let arkanInfo = SoulNumberData.allArkans[soulNumberValue]!
        
        return ArkanCategory(сategoryTitle: "Число Души", arkanInfo: arkanInfo)
    }
    
    private func calculateKarmaNumber() -> ArkanCategory {
        let karmaNumberValue = reduceToArkan(day + month)
        let arkanInfo = KarmaNumberData.allArkans[karmaNumberValue]!
        
        return ArkanCategory(сategoryTitle: "Число Кармы", arkanInfo: arkanInfo)
    }
    
    private func calculatePersonalityNumber() -> ArkanCategory {
        let personalityNumberValue = reduceToArkan(month + year)
        let arkanInfo = PersonalityNumberData.allArkans[personalityNumberValue]!
        
        return ArkanCategory(сategoryTitle: "Число Личности", arkanInfo: arkanInfo)
    }
    
    private func calculateKarmicKnots() -> ArkanCategory {
        // Собираем значения Арканов из других расчетов
        let arkanValues = [
            calculateDestinyNumber().arkanInfo,
            calculateLifePathNumber().arkanInfo,
            calculateSoulNumber().arkanInfo,
            calculateKarmaNumber().arkanInfo,
            calculatePersonalityNumber().arkanInfo
        ]
        
        // Подсчитываем частоту появления каждого Аркана
        var frequency: [ArkanInfo: Int] = [:]
        for arkan in arkanValues {
            frequency[arkan, default: 0] += 1
        }
        
        // Ищем Аркан с максимальной частотой (кармические узлы)
        if let karmicKnotArkan = frequency.max(by: { $0.value < $1.value })?.key {
            return ArkanCategory(сategoryTitle: "Кармические Узлы", arkanInfo: karmicKnotArkan)
        } else {
            // На случай, если нет повторяющихся чисел
            return ArkanCategory(сategoryTitle: "Кармические Узлы", arkanInfo: arkanValues.first!)
        }
    }
    
    private func calculateResourcesAndTalents() -> ArkanCategory {
        // Получаем значения Арканов для чисел Судьбы и Души
        let destinyNumberValue = calculateDestinyNumber().arkanInfo.arkanNumber
        let soulNumberValue = calculateSoulNumber().arkanInfo.arkanNumber
        
        // Пример: складываем значения Арканов Судьбы и Души, чтобы получить ресурсный потенциал
        let combinedValue = reduceToArkan(destinyNumberValue + soulNumberValue)
        let arkanInfo = ResourcesAndTalentsData.allArkans[combinedValue]!
        
        return ArkanCategory(сategoryTitle: "Ресурсы и Таланты", arkanInfo: arkanInfo)
    }
    
    private func calculateEmotionalTraits() -> ArkanCategory {
        // Получаем числовые значения Арканов для Числа Личности и Числа Души
        let personalityNumberValue = calculatePersonalityNumber().arkanInfo.arkanNumber
        let soulNumberValue = calculateSoulNumber().arkanInfo.arkanNumber

        // Суммируем их и приводим к числу Аркана
        let combinedValue = reduceToArkan(personalityNumberValue + soulNumberValue)
        let arkanInfo = EmotionalAndPersonalTraitsData.allArkans[combinedValue]!
        
        return ArkanCategory(сategoryTitle: "Эмоциональные и Личные Качества", arkanInfo: arkanInfo)
    }
    
    private func calculateProfessionsAndRoles() -> ArkanCategory {
        // Получаем числовое значение Аркана для Числа Судьбы
        let destinyNumberValue = calculateDestinyNumber().arkanInfo.arkanNumber

        // Приводим это значение к числу Аркана, если это необходимо
        let arkanInfo = ProfessionsAndRolesData.allArkans[destinyNumberValue]!
        
        return ArkanCategory(сategoryTitle: "Подходящие Профессии и Жизненные Роли", arkanInfo: arkanInfo)
    }
    
    private func calculateMoneyFlows() -> ArkanCategory {
        // Получаем числовые значения Арканов для Числа Кармы и Числа Личности
        let karmaNumberValue = calculateKarmaNumber().arkanInfo.arkanNumber
        let personalityNumberValue = calculatePersonalityNumber().arkanInfo.arkanNumber

        // Суммируем их и приводим к числу Аркана для определения денежного потока
        let combinedValue = reduceToArkan(karmaNumberValue + personalityNumberValue)
        let arkanInfo = MoneyFlowsData.allArkans[combinedValue]!
        
        return ArkanCategory(сategoryTitle: "Денежный Поток", arkanInfo: arkanInfo)
    }
    
    private func calculateEnergyFlows() -> ArkanCategory {
        // Получаем числовые значения Арканов для Числа Судьбы, Числа Души и Числа Кармы
        let destinyNumberValue = calculateDestinyNumber().arkanInfo.arkanNumber
        let soulNumberValue = calculateSoulNumber().arkanInfo.arkanNumber
        let karmaNumberValue = calculateKarmaNumber().arkanInfo.arkanNumber

        // Суммируем значения для общего энергетического потока
        let combinedValue = reduceToArkan(destinyNumberValue + soulNumberValue + karmaNumberValue)
        let arkanInfo = EnergyFlowsData.allArkans[combinedValue]!
        
        return ArkanCategory(сategoryTitle: "Энергетические Потоки и Зоны Роста", arkanInfo: arkanInfo)
    }
    
    private func calculateRecommendations() -> ArkanCategory {
        // Получаем числовые значения Арканов для всех ключевых чисел
        let destinyNumberValue = calculateDestinyNumber().arkanInfo.arkanNumber
        let soulNumberValue = calculateSoulNumber().arkanInfo.arkanNumber
        let karmaNumberValue = calculateKarmaNumber().arkanInfo.arkanNumber
        let lifePathNumberValue = calculateLifePathNumber().arkanInfo.arkanNumber
        let personalityNumberValue = calculatePersonalityNumber().arkanInfo.arkanNumber

        // Суммируем значения, чтобы получить итоговое число для рекомендаций
        let combinedValue = reduceToArkan(destinyNumberValue + soulNumberValue + karmaNumberValue + lifePathNumberValue + personalityNumberValue)
        let arkanInfo = RecommendationsData.allArkans[combinedValue]!
        
        return ArkanCategory(сategoryTitle: "Рекомендации", arkanInfo: arkanInfo)
    }
}
