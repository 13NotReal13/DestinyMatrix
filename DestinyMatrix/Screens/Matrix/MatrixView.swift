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
            
            ScrollView {
                VStack {
                    DestinyNumberView(destinyNumber: matrixData.lifeNumbers.destinyNumber)
                }
            }
            .padding()
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
