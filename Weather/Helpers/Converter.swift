//
//  Converter.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import Foundation

struct Converter {
    static func getCelsium(temperature: Double) -> String {
        let intTemperature = Int(temperature)
        var temperatureString = "\(intTemperature)°"
        if intTemperature > 0 {
            temperatureString = "+\(temperatureString)"
        }
        return temperatureString
    }
    
    static func getWindDirection(degree: Int) -> WindDirection {
        switch degree {
        case 23...67:
            return .northEast
        case 68...112:
            return .east
        case 113...157:
            return .southEast
        case 158...202:
            return .south
        case 203...247:
            return .northWest
        case 248...292:
            return .west
        case 293...337:
            return .northWest
        default:
            return .north
        }
    }
}
