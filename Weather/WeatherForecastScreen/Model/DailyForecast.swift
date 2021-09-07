//
//  Forecast.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import Foundation
import SwiftUI

struct DailyForecast: Identifiable {
    var id = UUID()
    var date = Date()
    var dayTemperature: String = ""
    var nightTemperature: String = ""
    var weather: String = ""

    init(response: DailyListForecastResponse) {
        self.date = Date(timeIntervalSince1970: TimeInterval(response.dt))
        self.dayTemperature = Converter.getCelsium(temperature: response.temperature.day)
        self.nightTemperature = Converter.getCelsium(temperature: response.temperature.night)
        self.weather = "\(response.weather[0].main)"
    }
}

#if DEBUG
let testData = [
    DailyForecast(response: DailyListForecastResponse(dt: 762345, temperature: TempResponse(day: 15, night: 12), weather: [WeatherInfoResponse(main: "Cloudy")])),
    DailyForecast(response: DailyListForecastResponse(dt: 762345, temperature: TempResponse(day: 15, night: 12), weather: [WeatherInfoResponse(main: "Cloudy")])),
    DailyForecast(response: DailyListForecastResponse(dt: 762345, temperature: TempResponse(day: 15, night: 12), weather: [WeatherInfoResponse(main: "Cloudy")]))
]

#endif
