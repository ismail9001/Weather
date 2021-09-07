//
//  SearchViewModel.swift
//  Weather
//
//  Created by Iskander Nizamov on 02.09.2021.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Binding var selectedCity: String
    
    init(selectedCity: Binding<String>) {
        self._selectedCity = selectedCity
    }
}
