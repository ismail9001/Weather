//
//  WeatherForecastViewModel.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import Foundation

class WeatherForecastViewModel: ObservableObject {
    
    let networkService: NetworkService
    var timer: Timer?
    
    @Published var dailyForecasts: [DailyForecast] = Array()
    @Published var cityForecast: CityForecast
    @Published var selectedCity: String = "Kazan"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        self.cityForecast = CityForecast.getEmptyForecast()
    }
    
    func startFetchingData() {
        getData()
        setTimer()
    }
    
    private func setTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.getData()
        }
    }
    
    private func getData() {
        networkService.getDailyForecast() { [weak self] forecasts in
            //            for dayForecast in forecasts.list {
            //                self?.dailyForecasts.append(DailyForecast(response: dayForecast))
            //            }
            guard let self = self else { return }
            self.dailyForecasts = []
            for i in 0...15 {
                self.dailyForecasts.append(DailyForecast(response: DailyListForecastResponse(dt: 1630238673 + (i * 60 * 60 * 24), temperature: TempResponse(day: Double.random(in: 1...20), night: Double.random(in: 1...20)), weather: [WeatherInfoResponse(main: WeatherImage.allCases.randomElement()?.rawValue ?? WeatherImage.cloud.rawValue)])))
            }
        }
        
        networkService.getWeatherDataByCity(city: selectedCity) { [weak self] cityResponse in
            guard let self = self else { return }
            self.cityForecast = CityForecast.convertToCityForecast(response: cityResponse)
        }
    }
}
