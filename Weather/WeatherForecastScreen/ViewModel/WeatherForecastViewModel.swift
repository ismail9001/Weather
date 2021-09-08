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
    
    @Published var dailyForecasts: [DailyForecast]
    @Published var cityForecast: CityForecast
    @Published var selectedCity: String
    @Published var isLoading: Bool = false
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        self.cityForecast = CityForecast.getEmptyForecast()
        self.dailyForecasts = Array()
        self.selectedCity = "Kazan"
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
        isLoading = true
        networkService.getDailyForecast() { [weak self] forecasts in
            //            for dayForecast in forecasts.list {
            //                self?.dailyForecasts.append(DailyForecast(response: dayForecast))
            //            }
            guard let self = self else { return }
            self.dailyForecasts = []
            for i in 0...15 {
                self.dailyForecasts.append(DailyForecast(response: DailyListForecastResponse(dt: 1630238673 + (i * 60 * 60 * 24), temperature: TempResponse(day: Double.random(in: 1...20), night: Double.random(in: 1...20)), weather: [WeatherInfoResponse(main: AppImage.allCases.randomElement()?.rawValue ?? AppImage.cloud.rawValue)])))
            }
        }
        
        networkService.getWeatherDataByCity(city: selectedCity) { [weak self] cityResponse in
            guard let self = self else { return }
            self.cityForecast = CityForecast.convertFrom(response: cityResponse)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
        }
    }
}
