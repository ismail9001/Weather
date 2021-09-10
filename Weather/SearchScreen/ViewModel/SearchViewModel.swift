//
//  SearchViewModel.swift
//  Weather
//
//  Created by Iskander Nizamov on 02.09.2021.
//

import MapKit
import SwiftUI

class SearchViewModel: ObservableObject {
    
    let networkService: NetworkService
    
    //let zoomDelta: Double = 0.040 //todo Nikite
    let zoomDelta: Double = 2
    @Binding var selectedCityName: String
    @Published var bottomSheetShown: Bool
    @Published var selectedCity: CityForecast {
        didSet {
            annotation.removeAll()
            annotation.append(selectedCity)
        }
    }
    @Published var coordinateRegion: MKCoordinateRegion
    var locManager: LocationManager
    @Published var placeholder: String
    @Published var annotation: [CityForecast]
    @Published var popularCities: [City] = [City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244)),
                                        City(name: "Kazan", coord: Coordinate(lon: 49.108891, lat: 55.796391)),
                                        City(name: "Samara", coord: Coordinate(lon: 50.221245, lat: 53.241505)),
                                        City(name: "Rostov-na-Donu", coord: Coordinate(lon: 39.715, lat: 47.2332)),
                                        City(name: "Kiev", coord: Coordinate(lon: 30.5238, lat: 50.45466)),
                                        City(name: "Saint Petersburg", coord: Coordinate(lon: 30.3350986, lat: 59.9342802)),
                                        City(name: "Nizhniy Novgorod", coord: Coordinate(lon: 44.0092, lat: 56.3299)),
                                        City(name: "Omsk", coord: Coordinate(lon: 73.36859, lat: 54.99244)),
                                        City(name: "Kaliningrad", coord: Coordinate(lon: 20.51095, lat: 54.70649)),
                                        City(name: "Yekaterinburg", coord: Coordinate(lon: 60.6122, lat: 56.8519)),
                                        City(name: "Ufa", coord: Coordinate(lon: 55.96779, lat: 54.74306))]
    
    init(selectedCity: Binding<String>, networkService: NetworkService){
        self.networkService = networkService
        self._selectedCityName = selectedCity
        
        bottomSheetShown = false
        self.selectedCity = CityForecast.getEmptyForecast()
        placeholder = Localization.addLocation.localized
        annotation = []
        locManager = LocationManager()
        coordinateRegion = MKCoordinateRegion(
                       center: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423),
                       span: MKCoordinateSpan(latitudeDelta: zoomDelta, longitudeDelta: zoomDelta)
                   )
    }
    
    func updateMap(with city: City) {
        coordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon),
            span: MKCoordinateSpan(latitudeDelta: zoomDelta, longitudeDelta: zoomDelta)
        )
    }
    
    func updateSelectedCity(with city: City) {
        selectedCityName = city.name
        placeholder = city.name
        Config.shared.addCity(city.name)
    }
    
    func updateSelectedCity() {
        selectedCityName = selectedCity.cityName
        placeholder = selectedCity.cityName
        Config.shared.addCity(selectedCity.cityName)
    }
    
    func getData(selectedCity: String) {
        networkService.getWeatherDataByCity(city: selectedCity) { [weak self] cityResponse in
            guard let self = self else { return }
            self.selectedCity = CityForecast.convertFrom(response: cityResponse)
            self.bottomSheetShown = true
        }
    }
}
