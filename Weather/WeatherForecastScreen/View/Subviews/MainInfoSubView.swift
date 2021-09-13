//
//  MainInfoSubView.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import SwiftUI

struct MainInfoSubView: View {
    
    @Binding var cityForecast: CityForecast
    @Binding var selectedCityName: String
    let mainHeaderTextSize: CGFloat = 72.0
    
    var body: some View {
        HStack(alignment: .center) {
            Text(cityForecast.cityName)
                .padding(.leading)
                .modifier(CityHeader())
            Spacer()
            NavigationLink(destination: ViewFactory.buildView(for: .citiesList(selectedCityName: $selectedCityName))) {
                IconView(name: AppImage.list, fontSize: 17, color: CustomColor.whiteIconColor)
            }
            .padding(.trailing, MagicSpacer.x4)
        }
        HStack(alignment: .center) {
            VStack(alignment: .leading){
                Text(cityForecast.temperature)
                    .modifier(MainTemperature())
                Text(Localization.localize(from: cityForecast.weather))
                    .modifier(SecondaryWhiteText())
                    .padding(.top, MagicSpacer.x1)
            }
            .padding(.leading)
            Spacer()
            IconView(name: AppImage.withLabel(cityForecast.weather), fontSize: mainHeaderTextSize, color: CustomColor.whiteIconColor)
                .padding(.trailing, MagicSpacer.x4)
        }
    }
}

//struct MainInfoSubView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainInfoSubView(cityForecast: .constant(testCityForecast), selectedCityName: .constant(CityForecast.getEmptyForecast())
//    }
//}
