//
//  SearchResultTable.swift
//  Weather
//
//  Created by Iskander Nizamov on 03.09.2021.
//

import SwiftUI

struct SearchResultTable: View {
    
    @Binding var searchLocation: String
    @Binding var bottomSheetShown: Bool
    @Binding var isMapSearch: Bool
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.popularCities.filter{ self.searchLocation.isEmpty ? true :
                                    $0.name.lowercased().contains(searchLocation.lowercased()) }, id: \.self) { city in
                SearchResultTableCell(city: city, tapAction: {
                    if isMapSearch {
                        viewModel.getDataByName(selectedCity: city.name)
                        searchLocation = ""
                        viewModel.placeholder = city.name
                    } else {
                        viewModel.updateSelectedCity(with: city)
                        NavigationCoordinator.popToRootView()
                    }
                })
            }
            Spacer()
        }
    }
}

struct SearchResultTable_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultTable(searchLocation: .constant(""), bottomSheetShown: .constant(true),
                          isMapSearch: .constant(true), viewModel: SearchViewModel(selectedCityName: .constant("Moscow"), networkService: DIContainer.shared.networkService))
    }
}
