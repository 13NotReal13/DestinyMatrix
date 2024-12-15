//
//  MatrixCalculation.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 08/12/2024.
//

import Foundation

struct MatrixCalculation {
    let name: String
    let dateOfBirthday: Date
    
    var matrixData: MatrixData {
        return MatrixData(
            name: name,
            dateOfBirthday: dateOfBirthday,
            
            destinyNumber: DestinyNumberArkans.allArkans[destinyNumberValue]!,
            lifePath: LifePathArkans.allArkans[lifePathValue]!,
            relationships: RelationshipsArkans.allArkans[relationshipsValue]!,
            finances: FinancesArkans.allArkans[financesValue]!,
            career: CareerArkans.allArkans[careerValue]!,
            health: HealthArkans.allArkans[healthValue]!,
            talents: TalentsArkans.allArkans[talentsValue]!,
            challenges: ChallengesArkans.allArkans[challengesValue]!,
            personalGrowth: PersonalGrowthArkans.allArkans[personalGrowthValue]!,
            innerSelf: InnerSelfArkans.allArkans[innerSelfValue]!,
            purpose: PurposeArkans.allArkans[purposeValue]!,
            karmicLessons: KarmicLessonsArkans.allArkans[karmicLessonsValue]!,
            futureProspects: FutureProspectsArkans.allArkans[futureProspectsValue]!
        )
    }
    
    private let day: Int
    private let month: Int
    private let year: Int
    
    init(name: String, dateOfBirthday: Date) {
        self.name = name
        self.dateOfBirthday = dateOfBirthday
        
        let calendar = Calendar.current
        self.day = calendar.component(.day, from: dateOfBirthday)
        self.month = calendar.component(.month, from: dateOfBirthday)
        self.year = calendar.component(.year, from: dateOfBirthday)
    }
    
    // Функция для приведения числа к аркану (1-22)
    private func reduceToArkan(_ number: Int) -> Int {
        var num = number
        while num > 22 {
            num = String(num).compactMap { $0.wholeNumberValue }.reduce(0, +)
        }
        // Если итог 0, можно например считать его 22 или 1, в зависимости от логики
        return num == 0 ? 22 : num
    }
    
    // Числовое значение имени (примерная логика)
    private var nameSum: Int {
        // Допустим суммируем юникод значения только букв имени
        // Можно придумать любую логику
        return name.unicodeScalars
            .filter { $0.isASCII == false }
            .map { Int($0.value) }
            .reduce(0, +)
    }
    
    // Для destinyNumber возьмём логику "Числа Судьбы" из старого кода
    private var destinyNumberValue: Int {
        let sumDateString = "\(day)\(month)\(year)"
        let sumDateInt = Int(sumDateString) ?? 0
        return reduceToArkan(sumDateInt)
    }
    
    // Жизненный Путь
    private var lifePathValue: Int {
        return reduceToArkan(day + month + year)
    }
    
    // Остальные берём из описанных формул выше:
    private var relationshipsValue: Int {
        return reduceToArkan(destinyNumberValue + day)
    }
    
    private var financesValue: Int {
        return reduceToArkan(lifePathValue + month)
    }
    
    private var careerValue: Int {
        return reduceToArkan(destinyNumberValue + year)
    }
    
    private var healthValue: Int {
        return reduceToArkan(day + month + year + destinyNumberValue)
    }
    
    private var talentsValue: Int {
        return reduceToArkan(nameSum)
    }
    
    private var challengesValue: Int {
        return reduceToArkan(day + nameSum)
    }
    
    private var personalGrowthValue: Int {
        return reduceToArkan(lifePathValue + nameSum)
    }
    
    private var innerSelfValue: Int {
        return reduceToArkan(destinyNumberValue + nameSum)
    }
    
    private var purposeValue: Int {
        return reduceToArkan(destinyNumberValue + lifePathValue + nameSum)
    }
    
    private var karmicLessonsValue: Int {
        return reduceToArkan((day + month) + destinyNumberValue)
    }
    
    private var futureProspectsValue: Int {
        return reduceToArkan(destinyNumberValue + lifePathValue + month + nameSum)
    }
}
