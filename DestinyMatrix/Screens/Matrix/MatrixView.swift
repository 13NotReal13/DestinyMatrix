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
    @State private var selectedSectionForLeftButtons = 1
    
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
                    Text(matrixData.name)
                    Text(" - ")
                    Text(matrixData.dateOfBirthday.formattedDate())
                }
                .customText(fontSize: 24, textColor: .white)
                .padding(.horizontal)
                .padding(.top, 8)
                .frame(maxWidth: .infinity)
                
                HStack {
                    LeftNavigationButtonsView(
                        selectedSection: $selectedSection,
                        selectedSectionForLeftButtons: $selectedSectionForLeftButtons
                    )
                    .padding(.leading)
                    
                    ScrollViewReader { proxy in
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 30) {
                                ForEach(1..<14) { arkan in
                                    sectionView(number: arkan) {
                                        ArkanDetailView(arkanInfo: matrixData.allArkans[arkan - 1])
                                    }
                                }
                            }
                        }
                        .padding()
                        .onPreferenceChange(SectionPositionPreferenceKey.self) { positions in
                            let screenMidY = UIScreen.main.bounds.midY
                            // Находим секцию, ближайшую к центру экрана
                            if let closestSection = positions.min(by: { abs($0.value - screenMidY) < abs($1.value - screenMidY) })?.key {
                                if selectedSectionForLeftButtons != closestSection {
                                    selectedSectionForLeftButtons = closestSection
                                }
                            }
                        }
                        .onChange(of: selectedSection) { section in
                            withAnimation {
                                proxy.scrollTo(section, anchor: .top)
                            }
                        }
                    }
                }
            }
        }
    }
    
    struct SectionPositionPreferenceKey: PreferenceKey {
        static var defaultValue: [Int: CGFloat] = [:]

        static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
            value.merge(nextValue()) { $1 }
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
                    .preference(key: SectionPositionPreferenceKey.self,
                                value: [number: geometry.frame(in: .global).midY])
            }
        )
    }
}

#Preview {
    let dateComponents = DateComponents(year: 1994, month: 1, day: 19)
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!
    
    let matrixData = MatrixCalculation(
        name: "Иван",
        dateOfBirthday: date,
        dateCreationMatrix: .now
    )
    
    MatrixView(matrixData: matrixData.matrixData)
}
