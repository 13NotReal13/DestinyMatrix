//
//  MatrixView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 11/11/2024.
//

import SwiftUI

struct MatrixView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var matrixData: MatrixData
    
    @State private var selectedSection = 1
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .customText(fontSize: 17, textColor: .white)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.down")
                            Text("Скачать .pdf")
                        }
                        .customText(fontSize: 17, textColor: .white)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    LeftNavigationButtonsView(selectedSection: $selectedSection)
                    .padding(.leading)
                    
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(spacing: 30) {
                                sectionView(number: 1) {
                                    DestinyNumberView(destinyNumber: matrixData.lifeNumbers.destinyNumber)
                                }
                                
                                sectionView(number: 2) {
                                    LifePathNumberView(lifePathNumber: matrixData.lifeNumbers.lifePathNumber)
                                }
                                
                                sectionView(number: 3) {
                                    SoulNumberView(soulNumber: matrixData.lifeNumbers.soulNumber)
                                }
                                
                                sectionView(number: 4) {
                                    KarmaNumberView(karmaNumber: matrixData.lifeNumbers.karmaNumber)
                                }
                                
                                sectionView(number: 5) {
                                    PersonalityNumberView(personalityNumber: matrixData.lifeNumbers.personalityNumber)
                                }
                                
                                sectionView(number: 6) {
                                    KarmicKnotsView(karmicKnotsNumber: matrixData.karmicKnots)
                                }
                                
                                sectionView(number: 7) {
                                    ResourcesAndTalentsView(resourcesAndTalentsNumber: matrixData.resourcesAndTalents)
                                }
                                
                                sectionView(number: 8) {
                                    EmotionalAndPersonalTraitsView(emotionalAndPersonalTraitsNumber: matrixData.emotionalAndPersonalTraits)
                                }
                                
                                sectionView(number: 9) {
                                    ProfessionsAndRolesView(professionsAndRolesNumber: matrixData.professionsAndRolesData)
                                }
                                
                                sectionView(number: 10) {
                                    MoneyFlowsView(moneyFlowsNumber: matrixData.moneyFlows)
                                }
                                
                                sectionView(number: 11) {
                                    EnergyFlowsView(energyFlowsNumber: matrixData.energyFlows)
                                }
                                
                                sectionView(number: 12) {
                                    RecommendationsView(recommendationsNumber: matrixData.recommendations)
                                }
                            }
                            .padding(.trailing)
                        }
                        .padding()
                        .onChange(of: selectedSection) { section in
                            proxy.scrollTo(section, anchor: .top)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func sectionView<Content: View>(number: Int, @ViewBuilder content: () -> Content) -> some View {
        VStack {
            content()
        }
        .id(number)
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onChange(of: geometry.frame(in: .global).midY) { newPosition in
                        let screenMidY = UIScreen.main.bounds.height / 2
                        if abs(newPosition - screenMidY) < 50 {
                            selectedSection = number
                        }
                    }
            }
        )
    }
}

#Preview {
    let dateComponents = DateComponents(year: 1994, month: 1, day: 19)
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!
    
    let matrixData = MatrixCalculation(name: "Иван", dateOfBirthday: date)
    
    MatrixView(matrixData: matrixData.matrixData)
}
