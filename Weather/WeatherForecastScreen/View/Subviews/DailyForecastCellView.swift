//
//  DailyForecastCellView.swift
//  Weather
//
//  Created by Iskander Nizamov on 29.08.2021.
//

import SwiftUI

struct DailyForecastCellView: View {
    
    var columns: [GridItem] = [
        GridItem(alignment: .center),
        GridItem(alignment: .center),
        GridItem(alignment: .center)
    ]
    var forecast: DailyForecast
    var body: some View {
        HStack(spacing: MagicSpacer.x1) {
            VStack(alignment: .leading) {
                Text(forecast.date.getDate(format: DateFormat.dayMonth)).modifier(DateGrayText())
                Text(forecast.date.getDate(format: DateFormat.weekDay)).modifier(DateMainText())
            }
            .padding(.vertical, MagicSpacer.x2)
            Spacer()
            LazyVGrid(columns: columns, content: {
                Section() {
                    IconStruct.getImage(with: forecast.weather, size: 17, color: .blue)
                    Text(forecast.dayTemperature)
                        .modifier(TemperatureDark())
                    Text(forecast.nightTemperature)
                        .modifier(TemperatureGray())
                }
            })
        }
        .padding(.horizontal, MagicSpacer.x4)
    }
}

struct DailyForecastCell_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastCellView(forecast: testData[0])
    }
}
