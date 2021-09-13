//
//  LocationsViewBuilder.swift
//  Weather
//
//  Created by Iskander Nizamov on 01.09.2021.
//

import SwiftUI

struct LocationsViewBuilder {
    
    static func view(selectedCityName: Binding<String>) -> some View {
        let viewModel = LocationsViewModel(networkService: DIContainer.shared.networkService, selectedCityName: selectedCityName)
        return LocationsView(viewModel: viewModel)
    }
}

