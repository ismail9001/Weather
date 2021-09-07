//
//  WeatherForecastViewBuilder.swift
//  Weather
//
//  Created by Iskander Nizamov on 01.09.2021.
//

import SwiftUI

struct WeatherForecastViewBuilder {
    
    static func view() -> some View {
        let viewModel = WeatherForecastViewModel(networkService: DIContainer.shared.networkService)
        return WeatherForecastView(viewModel: viewModel)
    }
}
