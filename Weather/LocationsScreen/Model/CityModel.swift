//
//  CityModel.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import Foundation

struct CityModel: Identifiable, Hashable {
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        return lhs.coord.lat == rhs.coord.lat && lhs.coord.lon == rhs.coord.lon
    }
    
    
    let id = UUID()
    let cityName: String
    let cityRegion: String
    let weather: String
    let temperature: String
    let dayNightTemperature: String
    let description: String
    let coord: Coordinates
    
    static func convertFrom(response: OneCallResponse) -> CityModel {
        
        let forecast = CityModel(cityName: response.name,
                                 cityRegion: response.sys.country,
                                 weather: response.weather[0].main,
                                 temperature: Converter.getCelsium(temperature: response.main.temp),
                                 dayNightTemperature: "\(Converter.getCelsium(temperature: response.main.temp_max))/\(Converter.getCelsium(temperature: response.main.temp_min))",
                                 description: "\(Localization.humidity.localized) \(response.main.humidity)% | \(Converter.getWindDirection(degree: response.wind.deg).description) | \(Int(response.wind.speed)) \(Localization.kmh.localized)",
                                 coord: response.coord)
        return forecast
    }
}
