//
//  CityForecast.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import Foundation

struct CityForecast: Identifiable, Hashable {
    let id = UUID()
    var cityName: String
    var cityRegion: String
    var temperature: String
    var weather: String
    let dayNightTemperature: String
    let description: String
    var feelsLikeTemp: String
    var windSpeed: Int
    var windDirection: WindDirection
    var pressure: Int
    var humidity: Int
    var coord: Coordinates
    
    static func convertFrom(response: OneCallResponse) -> CityForecast {
        
        let forecast = CityForecast(cityName: response.name,
                                    cityRegion: response.sys.country,
                                    temperature: Converter.getCelsium(temperature: response.main.temp),
                                    weather: "\(response.weather[0].main)",
                                    dayNightTemperature: "\(Converter.getCelsium(temperature: response.main.temp_max))/\(Converter.getCelsium(temperature: response.main.temp_min))",
                                    description: "\(Localization.humidity.localized) \(response.main.humidity)% | \(Converter.getWindDirection(degree: response.wind.deg).description) | \(Int(response.wind.speed)) \(Localization.kmh.localized)",
                                    feelsLikeTemp: Converter.getCelsium(temperature: response.main.temp),
                                    windSpeed: Int(response.wind.speed),
                                    windDirection: Converter.getWindDirection(degree: response.wind.deg),
                                    pressure: response.main.pressure,
                                    humidity: response.main.humidity,
                                    coord: response.coord)
        return forecast
    }
    
    static func getEmptyForecast() -> CityForecast {
        let forecast = CityForecast(cityName: "",
                                    cityRegion: "",
                                    temperature: "",
                                    weather: "",
                                    dayNightTemperature: "",
                                    description: "",
                                    feelsLikeTemp: "",
                                    windSpeed: 0,
                                    windDirection: WindDirection.north,
                                    pressure: 0,
                                    humidity: 0,
                                    coord: Coordinates(lon: 0.0, lat: 0.0))
        return forecast
    }
}

#if DEBUG
let testCityForecast = CityForecast(cityName: "Kiev", cityRegion: "Ukraine", temperature: "+17°", weather: "cloud", dayNightTemperature: "", description: "", feelsLikeTemp: "+15°", windSpeed: 5, windDirection: WindDirection.southEast, pressure: 1245, humidity: 85, coord: Coordinates(lon: 30.5238, lat: 50.45466))

#endif
