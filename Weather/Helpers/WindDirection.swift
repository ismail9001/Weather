//
//  WindDirection.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import SwiftUI

enum WindDirection: String {
    
    case north = "N"
    case east = "E"
    case west = "W"
    case south = "S"
    case northEast = "NE"
    case northWest = "NW"
    case southEast = "SE"
    case southWest = "SW"
    
    var description: String {
        switch self {
        case .north:
            return Localization.north.localized
        case .east:
            return Localization.east.localized
        case .west:
            return Localization.west.localized
        case .south:
            return Localization.south.localized
        case .northEast:
            return Localization.northEast.localized
        case .northWest:
            return Localization.northWest.localized
        case .southEast:
            return Localization.southEast.localized
        case .southWest:
            return Localization.southWest.localized
        }
    }
}
