//
//  ViewFactory.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import SwiftUI

struct ViewFactory {
    
    enum ViewType {
        enum StringType: String {
            case forecast,
                 citiesList,
                 search
        }
        
        case forecast,
             citiesList(selectedCityName: Binding<String>),
             search(selectedCityName: Binding<String>)
        
        var rowType: StringType {
            switch self {
            case .forecast:
                return .forecast
            case .citiesList:
                return .citiesList
            case .search:
                return .search
            }
        }
    }
    
    static func buildView(for type: ViewType) -> AnyView {
        switch type {
        case .forecast:
            return AnyView(WeatherForecastViewBuilder.view())
        case let .citiesList(selectedCityName):
            return AnyView(LocationsViewBuilder.view(selectedCityName: selectedCityName))
        case let .search(selectedCityName):
            return AnyView(SearchViewBuilder.view(selectedCityName: selectedCityName))
        }
    }
}
