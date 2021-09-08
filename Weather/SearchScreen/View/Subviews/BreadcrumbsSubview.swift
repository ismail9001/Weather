//
//  BreadcrumbsSubview.swift
//  Weather
//
//  Created by Iskander Nizamov on 03.09.2021.
//

import SwiftUI

struct BreadcrumbsSubview: View {
    
    @Binding var cities: [City]
    @Binding var selectedCity: String
    
    var body: some View {
        self.getHStack(for: cities)
    }
    
    private func getCellLength(for text: String) -> CGFloat {
        return MagicSpacer.x4 * 2 + CGFloat(text.count * 8) + MagicSpacer.x2 //TODO добавить зависимость от шрифта
    }
    
    private func getHStack(for cities: [City]) -> some View {
        var citiesGrid: [[City]] = [[]]
        var citiesArray = cities
        var hStackLength: CGFloat = 0
        var index = 0
        for city in citiesArray.sorted { $0.name.count < $1.name.count }.reversed() {
            let newLength = hStackLength + self.getCellLength(for: city.name)
            if newLength < UIScreen.screenWidth {
                hStackLength = newLength
            } else {
                hStackLength = self.getCellLength(for: city.name)
                index += 1
                if isThirdRow(rowCount: index) {
                    break
                }
                citiesGrid.append([])
            }
            citiesGrid[index].append(city)
            citiesArray.removeLast()
        }
        
        return LazyVStack(alignment: .leading) {
            ForEach(citiesGrid, id: \.self) { row in
                LazyHStack {
                    ForEach(row, id: \.self) { city in
                        item(for: city.name)
                            .onTapGesture {
                                selectedCity = city.name
                                Config.shared.addCity(city.name)
                                NavigationCoordinator.popToRootView()
                            }
                    }
                }
            }
        }
    }
    
    private func isThirdRow(rowCount: Int) -> Bool {
        rowCount > 1
    }
    
    private func item(for text: String) -> some View {
        Text(text)
            .modifier(CityBreadcrumbText())
            .padding(.vertical, MagicSpacer.x2)
            .padding(.horizontal, MagicSpacer.x4)
            .background(CustomColor.breadCrumbBackgroundColor)
            .clipShape(Capsule())
            .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(CustomColor.border, lineWidth: 1)
            )
    }
}

struct BreadcrumbsSubview_Previews: PreviewProvider {
    static var previews: some View {
        BreadcrumbsSubview(cities: .constant([City(name: "Kazan", coord: Coordinate(lon: 49.108891, lat: 55.796391)), City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244))]), selectedCity: .constant("Moscow"))
    }
}
