//
//  NavigationButtonView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 24/12/2024.
//

import SwiftUI

struct NavigationButtonView: View {
    @ObservedObject var enterDataViewModel: EnterDataViewModel
    
    var body: some View {
        NavigationLink(
            destination: PreloadMatrixDataView(
                matrix: ShortMatrixData(
                name: enterDataViewModel.name,
                dateOfBirthday: enterDataViewModel.dateBirthday,
                dateCreationMatrix: .now)
            ),
            isActive: $enterDataViewModel.canNavigate
        ) {
            Button {
                enterDataViewModel.validateName()
                enterDataViewModel.validateDate()
                
                if enterDataViewModel.isNameValid && enterDataViewModel.isDateValid {
                    StorageManager().add(
                        shortMatrixData: ShortMatrixData(
                            name: enterDataViewModel.name,
                            dateOfBirthday: enterDataViewModel.dateBirthday,
                            dateCreationMatrix: .now
                        )
                    )
                    
                    FirebaseLogManager.shared.logMatrixCalculated(
                        name: enterDataViewModel.name,
                        dateOfBirth: enterDataViewModel.dateBirthday.formattedDate()
                    )
                    
                    enterDataViewModel.canNavigate = true
                }
            } label: {
                Text("Далее")
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .customText(fontSize: 16, textColor: .white)
                    .customButtonStyle(shape: .capsule)
                    .padding(.top, 16)
            }
        }
    }
}

#Preview {
    NavigationButtonView(enterDataViewModel: EnterDataViewModel())
}
