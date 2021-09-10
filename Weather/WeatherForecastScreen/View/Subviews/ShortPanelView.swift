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
            IconView(name: AppImage.wind, color: CustomColor.whiteIconColor).frame(alignment: .center)
            IconView(name: AppImage.compass, color: CustomColor.whiteIconColor).frame(alignment: .center)
            IconView(name: AppImage.drop, color: CustomColor.whiteIconColor).frame(alignment: .center)
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
