//
//  HourlyForecastCellView.swift
//  Weather
//
//  Created by Iskander Nizamov on 30.08.2021.
//

import SwiftUI

struct HourlyForecastCellView: View {
    let hour: String
    var body: some View {
        VStack(alignment: .leading, spacing: MagicSpacer.x3) {
            Text(hour + ":00")
                .modifier(SecondaryWhiteText())
            IconView(name: AppImage.cloud, fontSize: 17, color: CustomColor.whiteIconColor)
            Text(Converter.getCelsium(temperature: Double.random(in: 10...25))).modifier(SecondaryWhiteText())
        }
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastCellView(hour: "14:00")
    }
}
