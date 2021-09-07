//
//  SearchResultTable.swift
//  Weather
//
//  Created by Iskander Nizamov on 03.09.2021.
//

import SwiftUI

struct SearchResultTable: View {
    
    @Binding var cities: [City]
    @Binding var location: String
    @Binding var selectedCity: String
    @Binding var isEditing: Bool
    @State var isMapSearch: Bool
    
    var body: some View {
        ScrollView {
            ForEach(cities.filter( {$0.name.lowercased().contains(location.lowercased()) }), id: \.self) { city in
                SearchResultTableCell(city: city, tapAction: {
                    if isMapSearch {
                        isEditing = false
                    } else {
                        selectedCity = city.name
                        Config.shared.addCity(city.name)
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
        SearchResultTable(cities: .constant([City(name: "Kazan", coord: Coordinate(lon: 49.108891, lat: 55.796391)), City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244))]), location: .constant(""), selectedCity: .constant("Moscow"),
                          isEditing: .constant(false),
                          isMapSearch: true)
    }
}
