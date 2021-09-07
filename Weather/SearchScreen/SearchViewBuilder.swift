//
//  SearchViewBuilder.swift
//  Weather
//
//  Created by Iskander Nizamov on 02.09.2021.
//

import SwiftUI

struct SearchViewBuilder {
    
    static func view(selectedCity: Binding<String>) -> some View {
        let viewModel = SearchViewModel(selectedCity: selectedCity)
        return SearchView(viewModel: viewModel)
    }
}

