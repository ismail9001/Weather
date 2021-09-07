//
//  LocationCell.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import SwiftUI

struct LocationCellView: View {
    
    var cityModel: CityModel
    @Binding var isEditing: Bool
    let onDetail: () -> Void
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text(cityModel.cityName).modifier(DateMainText())
                        IconStruct.getImage(with: AppImage.mapPin.rawValue, color: .blue)
                    }
                    Text(cityModel.cityRegion).modifier(LocationDescription())
                        .padding(.top, MagicSpacer.x05)
                }
                Spacer()
                if !isEditing {
                    IconStruct.getImage(with: WeatherImage.cloud.rawValue, size: 24.0, color: .gray)
                    Text(cityModel.temperature).modifier(TemperatureLocationDark())
                } else {
                    Button(action: onDetail) {
                        IconStruct.getImage(with: AppImage.multiply.rawValue, size: 17.0, color: .red)
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
