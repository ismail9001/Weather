//
//  SearchResultTableCell.swift
//  Weather
//
//  Created by Iskander Nizamov on 03.09.2021.
//

import SwiftUI

struct SearchResultTableCell: View {
    
    var city: City
    let tapAction: () -> Void
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(city.name)").modifier(CitySearchResultText())
                Text("\(city.name)").modifier(LocationDescription())
            }
            Spacer()
        }
        .background(CustomColor.backgroundColor)
        .padding(.leading, 43)
        .onTapGesture {
            tapAction()
        }
        Divider()
            .padding(.horizontal, MagicSpacer.x4)
    }
}

struct SearchResultTableCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultTableCell(city: City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244)), tapAction: {print ("")} )
    }
}
