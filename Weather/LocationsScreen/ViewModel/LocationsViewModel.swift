//
//  LocationsViewModel.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    let networkService: NetworkService
    var timer: Timer?
    
    @Published var citiesForecast: [CityModel] = []
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func startFetchingData() {
        getCitiesData()
        setTimer()
    }
    
    func deleteLocation(location: CityModel) {
        for (index, city) in citiesForecast.enumerated() {
            if location.id == city.id {
                citiesForecast.remove(at: index)
                Config.shared.deleteCity(location.cityName)
                return
            }
        }
    }
    
    private func setTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.getCitiesData()
        }
    }
    
    private func getCitiesData() {
        self.citiesForecast = []
        for cityName in Config.shared.cities {
            networkService.getWeatherDataByCity(city: cityName) { [weak self] city in
                guard let self = self else { return }
                self.citiesForecast.append(CityModel.convertFrom(response: city))
            }
        }
    }
}
