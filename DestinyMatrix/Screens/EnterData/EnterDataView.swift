//
//  EnterDataView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 01/11/2024.
//

import SwiftUI

struct EnterDataView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var enterDataViewModel = EnterDataViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                AnimatedStarryBackgroundView()
                
                VStack() {
                    Completed3DSphere()
                    
                    Spacer()
                    
                    EnterDataFormView(enterDataViewModel: enterDataViewModel)
                    
                    Spacer()
                    
                    NavigationButtonView(enterDataViewModel: enterDataViewModel)
                    
                    Spacer()
                }
            }
            .onTapGesture {
                UIApplication.shared.connectedScenes
                    .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                    .first?
                    .endEditing(true)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    CustomBackButtonView { presentationMode.wrappedValue.dismiss() }
                }
                
                ToolbarItem(placement: .principal) {
                    CustomNavigationTitleView(title: "Матрица Судьбы")
                }
            }
            .sheet(isPresented: $enterDataViewModel.isDatePickerPresented) {
                DatePickerModalView(enterDataViewModel: enterDataViewModel)
                    .preferredColorScheme(.light)
            }
            .onAppear {
                FirebaseLogManager.shared.logScreenView(screenName: "enter_data")
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ZStack {
        AnimatedStarryBackgroundView()
        
        EnterDataView()
    }
}
        
