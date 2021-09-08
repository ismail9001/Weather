//
//  SearchResultTable.swift
//  Weather
//
//  Created by Iskander Nizamov on 03.09.2021.
//

import SwiftUI

struct SearchResultTable: View {
    
    var cities: [City]
    
    @Binding var searchLocation: String
    @Binding var selectedCity: String
    @Binding var isEditing: Bool
    @Binding var bottomSheetShown: Bool
    @State var isMapSearch: Bool
    
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView {
            ForEach(cities.filter( {$0.name.lowercased().contains(searchLocation.lowercased()) }), id: \.self) { city in
                SearchResultTableCell(city: city, tapAction: {
                    if isMapSearch {
                        viewModel.getData(selectedCity: city.name)
                        viewModel.updateMap(with: city)
                        isEditing = false
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
        SearchResultTable(cities: [City(name: "Kazan", coord: Coordinate(lon: 49.108891, lat: 55.796391)), City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244))], searchLocation: .constant(""), selectedCity: .constant("Moscow"),
                          isEditing: .constant(false), bottomSheetShown: .constant(true),
                          isMapSearch: true, viewModel: SearchViewModel(selectedCity: .constant("Moscow"), networkService: DIContainer.shared.networkService))
    }
}
