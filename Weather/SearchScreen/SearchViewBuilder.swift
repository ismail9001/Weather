//
//  SearchViewBuilder.swift
//  Weather
//
//  Created by Iskander Nizamov on 02.09.2021.
//

import SwiftUI

struct SearchViewBuilder {
    
    static func view(selectedCityName: Binding<String>) -> some View {
        let viewModel = SearchViewModel(selectedCityName: selectedCityName, networkService: DIContainer.shared.networkService)
        return SearchView(viewModel: viewModel)
    }
}

