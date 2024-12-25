//
//  MatrixView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 11/11/2024.
//

import SwiftUI

struct MatrixView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = MatrixViewModel()
    
    @State var matrixData: MatrixData
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack(alignment: .leading) {
                    AnimatedStarryBackgroundView()
                    
                    VStack {
                        PersonalTitleView(matrixData: matrixData)
                        
                        MatrixScrollView(
                            viewModel: viewModel,
                            matrixData: matrixData
                        )
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        CustomBackButtonView { presentationMode.wrappedValue.dismiss() }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        DownloadPDFButtonView(viewModel: viewModel, matrixData: matrixData)
                    }
                }
            }
            .navigationBarHidden(true)
            
            LeftMenuView(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.showShareSheet) {
            ShareSheet(items: viewModel.shareItems)
        }
    }
}

#Preview {
    let dateComponents = DateComponents(year: 1994, month: 1, day: 19)
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!
    
    let matrixData = MatrixCalculation(
        name: "Иван",
        dateOfBirthday: date
    )
    
    MatrixView(matrixData: matrixData.matrixData)
}
