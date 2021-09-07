//
//  ShortPanelView.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import SwiftUI

struct ShortPanelView: View {
    
    @Binding var cityForecast: CityForecast
    
    var body: some View {
        VStack(spacing: MagicSpacer.x2){
            IconStruct.getImage(with: WeatherImage.wind.rawValue, size: 15, color: .white).frame(alignment: .center)
            IconStruct.getImage(with: WeatherImage.compass.rawValue, size: 15, color: .white).frame(alignment: .center)
            IconStruct.getImage(with: WeatherImage.drop.rawValue, size: 15, color: .white).frame(alignment: .center)
        }
        VStack(alignment: .leading, spacing: MagicSpacer.x3){
            Text("\(cityForecast.windSpeed) \(Localization.kmh.localized), \(cityForecast.windDirection.description)").modifier(SecondaryWhiteText())
            Text("\(cityForecast.pressure) \(Localization.hPA.localized)").modifier(SecondaryWhiteText())
            Text("\(cityForecast.humidity)%").modifier(SecondaryWhiteText())
        }
    }
}

struct ShortPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ShortPanelView(cityForecast: .constant(testCityForecast))
    }
}
