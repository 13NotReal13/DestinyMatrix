//
//  MatrixHelpInfoView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/12/2024.
//

import SwiftUI

struct Subcategory {
    let title: String
    let description: String
}

struct Category {
    let title: String
    let subcategories: [Subcategory]
}

struct MatrixHelpInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    let categories: [Category] = [
        Category(title: "1. Число Судьбы", subcategories: [
            Subcategory(title: "Расчет числа судьбы", description: "Методика вычисления числа судьбы на основе вашего имени и даты рождения."),
            Subcategory(title: "Значение числа судьбы", description: "Общее описание и характеристика полученного числа судьбы."),
            Subcategory(title: "Влияние на личность", description: "Как число судьбы формирует ваши черты характера и поведение."),
            Subcategory(title: "Совместимость с другими числами", description: "Анализ взаимодействия вашего числа судьбы с числами судьбы других людей."),
            Subcategory(title: "Рекомендации", description: "Советы по гармонизации жизни в соответствии с вашим числом судьбы.")
        ]),
        Category(title: "2. Жизненный Путь", subcategories: [
            Subcategory(title: "Основные этапы жизни", description: "Ключевые периоды вашей жизни и их значение для вашего развития."),
            Subcategory(title: "Направления развития", description: "Возможные пути самореализации и карьерного роста."),
            Subcategory(title: "Цели и задачи", description: "Определение жизненных приоритетов и постановка целей."),
            Subcategory(title: "Влияние внешних факторов", description: "Как окружение и обстоятельства влияют на ваш жизненный путь."),
            Subcategory(title: "Советы по достижению успеха", description: "Рекомендации для успешного достижения поставленных целей.")
        ]),
        Category(title: "3. Отношения", subcategories: [
            Subcategory(title: "Романтические отношения", description: "Перспективы в любви и браке, поиск гармонии в личной жизни."),
            Subcategory(title: "Дружеские связи", description: "Построение и укрепление дружеских отношений."),
            Subcategory(title: "Семейные отношения", description: "Взаимодействие с членами семьи и родственниками."),
            Subcategory(title: "Социальная адаптация", description: "Умение общаться, налаживать контакты и интегрироваться в коллективы."),
            Subcategory(title: "Совместимость", description: "Анализ с кем легче установить гармоничные и долгосрочные отношения.")
        ]),
        Category(title: "4. Деньги и Финансы", subcategories: [
            Subcategory(title: "Финансовый потенциал", description: "Ваши способности к заработку, накоплению и управлению финансами."),
            Subcategory(title: "Отношение к деньгам", description: "Психологические установки и убеждения относительно материального благополучия."),
            Subcategory(title: "Инвестиции и риски", description: "Склонность к финансовым авантюрам и умение управлять рисками."),
            Subcategory(title: "Финансовые препятствия", description: "Возможные трудности на пути к финансовой стабильности и способы их преодоления."),
            Subcategory(title: "Советы по управлению финансами", description: "Рекомендации для эффективного управления личными средствами.")
        ]),
        Category(title: "5. Карьера и Профессия", subcategories: [
            Subcategory(title: "Рекомендуемые сферы деятельности", description: "Области, в которых вы можете достичь наибольшего успеха."),
            Subcategory(title: "Профессиональные навыки", description: "Ключевые умения и компетенции, которые следует развивать."),
            Subcategory(title: "Карьерный рост", description: "Перспективы продвижения и профессионального развития."),
            Subcategory(title: "Рабочая среда", description: "Предпочтительные условия труда и типы коллективов."),
            Subcategory(title: "Советы по построению карьеры", description: "Стратегии для достижения профессиональных целей и удовлетворения от работы.")
        ]),
        Category(title: "6. Здоровье", subcategories: [
            Subcategory(title: "Физическое состояние", description: "Общий потенциал вашего здоровья и жизненной силы."),
            Subcategory(title: "Энергетический баланс", description: "Уровень жизненной энергии и способы его поддержания."),
            Subcategory(title: "Уязвимые места", description: "Органы и системы организма, требующие особого внимания."),
            Subcategory(title: "Профилактика и уход", description: "Рекомендации по поддержанию и улучшению здоровья."),
            Subcategory(title: "Эмоциональное благополучие", description: "Влияние эмоционального состояния на физическое здоровье.")
        ]),
        Category(title: "7. Таланты и Способности", subcategories: [
            Subcategory(title: "Врожденные таланты", description: "Способности и дарования, данные вам от природы."),
            Subcategory(title: "Творческий потенциал", description: "Склонности к искусству, музыке, литературе и другим видам творчества."),
            Subcategory(title: "Интеллектуальные способности", description: "Умственные ресурсы и их эффективное использование."),
            Subcategory(title: "Развитие навыков", description: "Методы раскрытия и усиления ваших способностей."),
            Subcategory(title: "Применение талантов", description: "Сферы, где вы можете максимально реализовать свои дарования.")
        ]),
        Category(title: "8. Испытания и Препятствия", subcategories: [
            Subcategory(title: "Основные трудности", description: "Проблемы и вызовы, с которыми вы можете столкнуться."),
            Subcategory(title: "Кармические задачи", description: "Уроки, которые необходимо усвоить для духовного роста."),
            Subcategory(title: "Внутренние конфликты", description: "Борьба с сомнениями, страхами и внутренними противоречиями."),
            Subcategory(title: "Внешние препятствия", description: "Влияние окружающих людей и обстоятельств на ваш путь."),
            Subcategory(title: "Стратегии преодоления", description: "Эффективные способы справиться с испытаниями и выйти из них сильнее.")
        ]),
        Category(title: "9. Личностный Рост", subcategories: [
            Subcategory(title: "Самоосознание", description: "Понимание своих истинных желаний, ценностей и целей."),
            Subcategory(title: "Духовное развитие", description: "Поиск внутренней гармонии и смыслов жизни."),
            Subcategory(title: "Эмоциональный интеллект", description: "Умение распознавать и управлять своими эмоциями."),
            Subcategory(title: "Обучение и образование", description: "Необходимость в постоянном развитии и приобретении новых знаний."),
            Subcategory(title: "Рекомендации по развитию", description: "Практики и методики для личностного и духовного роста.")
        ]),
        Category(title: "10. Внутренний Мир", subcategories: [
            Subcategory(title: "Психологический профиль", description: "Особенности вашего характера и их влияние на жизнь."),
            Subcategory(title: "Подсознательные мотивы", description: "Скрытые желания, страхи и убеждения, влияющие на поведение."),
            Subcategory(title: "Интуиция", description: "Способность доверять внутреннему голосу и принимать интуитивные решения."),
            Subcategory(title: "Медитация и самоанализ", description: "Инструменты для глубокого понимания себя."),
            Subcategory(title: "Гармония с собой", description: "Достижение внутреннего баланса и удовлетворенности жизнью.")
        ]),
        Category(title: "11. Предназначение", subcategories: [
            Subcategory(title: "Жизненная миссия", description: "Главная цель вашего существования и задачи, которые вы призваны выполнить."),
            Subcategory(title: "Вклад в общество", description: "Роль и влияние, которые вы можете оказать на окружающий мир."),
            Subcategory(title: "Смысл жизни", description: "Поиск и понимание глубинного смысла своего пути."),
            Subcategory(title: "Пути реализации", description: "Конкретные шаги для воплощения своего предназначения."),
            Subcategory(title: "Препятствия на пути", description: "Трудности, которые могут возникнуть, и способы их преодоления.")
        ]),
        Category(title: "12. Кармические Уроки", subcategories: [
            Subcategory(title: "Наследие прошлого", description: "Влияние прошлых жизней или опытов на настоящее."),
            Subcategory(title: "Повторяющиеся ситуации", description: "Сценарии, которые повторяются в вашей жизни и требуют осознания."),
            Subcategory(title: "Разрешение кармы", description: "Способы отработки кармических долгов и освобождения от них."),
            Subcategory(title: "Рост через опыт", description: "Извлечение мудрости и силы из пережитых уроков."),
            Subcategory(title: "Освобождение", description: "Как избавиться от негативных влияний и начать новую главу жизни.")
        ]),
        Category(title: "13. Будущее", subcategories: [
            Subcategory(title: "Краткосрочные перспективы", description: "Ожидаемые события и изменения в ближайшем будущем."),
            Subcategory(title: "Долгосрочные планы", description: "Ваши отдаленные цели, мечты и стремления."),
            Subcategory(title: "Потенциальные изменения", description: "Возможные повороты судьбы и как к ним подготовиться."),
            Subcategory(title: "Факторы влияния", description: "Внешние и внутренние факторы, способные повлиять на ваше будущее."),
            Subcategory(title: "Советы по формированию будущего", description: "Рекомендации по направлению жизни в желаемое русло.")
        ]),
    ]
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack(alignment: .center) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .customText(fontSize: 17, textColor: .white)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Text("Содержание:")
                    .font(.system(size: 28))
                    .foregroundStyle(.white)
                    .padding(.bottom, 16)
                
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(categories, id: \.title) { category in
                            Text(category.title)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 16) {
                        ForEach(categories, id: \.title) { category in
                            // Заголовок категории
                            Text(category.title)
                                .font(.system(size: 24))
                                .foregroundStyle(.white)
                            
                            VStack(spacing: 16) {
                                ForEach(category.subcategories, id: \.title) { subcategory in
                                    VStack(alignment: .leading, spacing: 4) {
                                        // Заголовок подкатегории
                                        Text(subcategory.title + ":")
                                            .font(.system(size: 20))
                                            .foregroundStyle(.white)
                                        // Описание подкатегории
                                        Text(subcategory.description)
                                            .font(.system(size: 17))
                                            .foregroundStyle(.white.opacity(0.8))
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MatrixHelpInfoView()
}
