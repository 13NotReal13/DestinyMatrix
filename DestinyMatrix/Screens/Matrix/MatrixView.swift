//
//  MatrixView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 11/11/2024.
//

import SwiftUI

struct MatrixView: View {
    @State var matrixData: MatrixData
    
    var body: some View {
        ZStack {
            AnimatedStarryBackgroundView()
            
            HStack {
                VStack {
                    ForEach(1..<13) { num in
                        Spacer()
                        
                        Text(String(num))
                            .customText(fontSize: 17, textColor: .white)
                            .foregroundStyle(.white)
                            .customButtonStyle(color1: .backgroundColor1, color2: .buttonColor1, shape: .circle)
                            .clipShape(.circle)
                            .overlay {
                                if num == 1 {
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                }
                            }
                            .shadow(color: .white, radius: num == 1 ? 5 : 0)
                    }
                }
                .padding(.leading)
                
                ScrollView {
                    VStack(spacing: 30) {
                        DestinyNumberView(destinyNumber: matrixData.lifeNumbers.destinyNumber)
                        
                        LifePathNumberView(lifePathNumber: matrixData.lifeNumbers.lifePathNumber)
                        
                        SoulNumberView(soulNumber: matrixData.lifeNumbers.soulNumber)
                        
                        KarmaNumberView(karmaNumber: matrixData.lifeNumbers.karmaNumber)
                        
                        PersonalityNumberView(personalityNumber: matrixData.lifeNumbers.personalityNumber)
                        
                        KarmicKnotsView(karmicKnotsNumber: matrixData.karmicKnots)
                    }
                    .padding(.trailing)
                }
                .padding()
            }
        }
    }
}

#Preview {
    let dateComponents = DateComponents(year: 1994, month: 1, day: 19)
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!
    
    let matrixData = MatrixCalculation(name: "Иван", dateOfBirthday: date)
    
    MatrixView(matrixData: matrixData.matrixData)
}
