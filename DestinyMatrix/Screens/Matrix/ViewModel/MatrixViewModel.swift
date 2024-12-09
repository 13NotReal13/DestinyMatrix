//
//  MatrixViewModel.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/12/2024.
//

import Foundation

final class MatrixViewModel: ObservableObject {
    @Published var selectedSection = 1
    @Published var selectedSectionForLeftButtons = 1
    @Published var isMenuOpen = false
}
