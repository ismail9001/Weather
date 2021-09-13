//
//  LocationCell.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import SwiftUI

struct LocationCellView: View {
    
    var cityModel: CityForecast
    @Binding var isEditing: Bool
    let onDetail: () -> Void
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text(cityModel.cityName).modifier(DateMainText())
                        IconView(name: AppImage.mapPin, color: .blue)
                    }
                    Text(cityModel.cityRegion).modifier(LocationDescription())
                        .padding(.top, MagicSpacer.x05)
                }
                Spacer()
                if !isEditing {
                    IconView(name: AppImage.withLabel(cityModel.weather), fontSize: 24, color: .gray)
                    Text(cityModel.temperature).modifier(TemperatureLocationDark())
                        .padding(.leading, MagicSpacer.x4)
                } else {
                    Button(action: onDetail) {
                        IconView(name: AppImage.multiply, fontSize: 17, color: .red)
                    }
                    .modifier(DeleteButton())
                }
            }
            if !isEditing { Divider()
                .padding(.top, MagicSpacer.x1)
                HStack{
                    Text(cityModel.description).modifier(LocationDescription())
                    Spacer()
                    Text(cityModel.dayNightTemperature).modifier(TemperatureLocationGray())
                }
            }
        }
        .modifier(LocationCell())
    }
}

//struct LocationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationCellView(cityModel: .constant(<#T##value: CityModel##CityModel#>))
//    }
//}
