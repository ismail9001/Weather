//
//  LocationsViewBuilder.swift
//  Weather
//
//  Created by Iskander Nizamov on 01.09.2021.
//

import SwiftUI

struct LocationsViewBuilder {
    
    static func view(selectedCity: Binding<String>) -> some View {
        let viewModel = LocationsViewModel(networkService: DIContainer.shared.networkService, selectedCity: selectedCity)
        return LocationsView(viewModel: viewModel)
    }
}

