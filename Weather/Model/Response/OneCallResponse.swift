//
//  OneCallResponse.swift
//  Weather
//
//  Created by Iskander Nizamov on 27.08.2021.
//

import Foundation

struct OneCallResponse: Codable {
    var name: String
    var main: MainInfoResponse
    var wind: WindInfoResponse
    var weather: [WeatherInfoResponse]
    var sys: CountryResponse
    var cityId: Int
    var coord: Coordinates
    
    enum CodingKeys: String, CodingKey {
        case name, main, wind, weather, sys, coord
        case cityId = "id"
    }
}

struct MainInfoResponse: Codable {
    var temp: Double
    var pressure: Int
    var humidity: Int
    var temp_min: Double
    var temp_max: Double
}

struct CountryResponse: Codable {
    var country: String?
}

struct WindInfoResponse: Codable {
    var speed: Double
    var deg: Int
}

struct WeatherInfoResponse: Codable {
    var main: String
}

struct DailyResponse: Codable {
    var cod: Int
    var list: [DailyListForecastResponse]?
}

struct Coordinates: Codable, Hashable {
    var lon: Double
    var lat: Double
}

struct DailyListForecastResponse: Codable {
    var dt: Int
    var temperature: TempResponse
    var weather: [WeatherInfoResponse]
    
    enum CodingKeys: String, CodingKey {
        case dt, weather
        case temperature = "temp"
    }
}

struct TempResponse: Codable {
    var day: Double
    var night: Double
}
