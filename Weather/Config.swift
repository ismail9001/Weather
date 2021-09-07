//
//  Config.swift
//  Weather
//
//  Created by Iskander Nizamov on 27.08.2021.
//

final class Config {
    
    let weatherApiKey = "b2f395b61d0fa4bf7a470c6f21b4db2b"
    let baseUrl = "https://api.openweathermap.org/data/2.5"
    let googleApiKey = "AIzaSyBn8KiRxl761CALtUeIkfk152JzFB_1AqM"
    var cities: [String] = ["Moscow", "Kazan", "Samara"]
    
    static var shared: Config = {
        let instance = Config()
        return instance
    }()
    
    func addCity(_ city: String) {
        self.cities.append(city)
    }
    
    func deleteCity(_ cityName: String) {
        for (index, city) in self.cities.enumerated() {
            if cityName == city {
                self.cities.remove(at: index)
                return
            }
        }
    }
    
    private init() {}
}
