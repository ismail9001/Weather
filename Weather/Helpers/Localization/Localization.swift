//
//  Localization.swift
//  Weather App
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import SwiftUI

enum Localization: String {
    
    case now = "NOW";
    case locations = "LOCATIONS";
    case humidity = "HUMIDITY";
    case kmh = "KMH";
    case hPA = "HPA";
    case addLocation = "ADD_LOCATION";
    case popularCities = "POPULAR_CITIES";
    case showMap = "SHOW_MAP";
    case enterLocation = "ENTER_LOCATION";
    
    // Wind directions
    case north = "N";
    case northWest = "NW";
    case northEast = "NE";
    case east = "E";
    case west = "W";
    case south = "S";
    case southWest = "SW";
    case southEast = "SE";
    
    // Weather
    case clouds = "CLOUDS"
    case rain = "RAIN"
    case thunderStorm = "THUNDERSTORM"
    case drizzle = "DRIZZLE"
    case snow = "SNOW"
    case mist = "MIST"
    case smoke = "SMOKE"
    case haze = "HAZE"
    case dust = "DUST"
    case fog = "FOG"
    case sand = "SAND"
    case ash = "ASH"
    case squall = "SQUALL"
    case tornado = "TORNADO"
    case clear = "CLEAR"
    
}

extension Localization {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    static func localize(from: String) -> String {
        guard let rawValue = Localization(rawValue: from.uppercased()) else { return from}
        return rawValue.localized
    }
}

