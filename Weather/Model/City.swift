//
//  City.swift
//  Weather
//
//  Created by Iskander Nizamov on 06.09.2021.
//

struct City : Hashable{
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name && lhs.coord == rhs.coord
    }
    
    var name: String
    var coord: Coordinate
}

struct Coordinate: Hashable, Equatable{
    var lon: Double
    var lat: Double
}
