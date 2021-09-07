//
//  SearchView.swift
//  Weather
//
//  Created by Iskander Nizamov on 02.09.2021.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedCityName: String
    {
        mutating didSet {
            selectedCity = getCity(for: selectedCityName)
        }
    }
    @State var selectedCity: City = City(name: "Kazan", coord: Coordinate(lon: 49.108891, lat: 55.796391))
    @State var location: String = ""
    @State private var isEditing = false
    @State private var mapChoosed = false
    @State var popularCities: [City] = [City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244)),
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
//    @State var popularCities: [String:(lon: Double, lat: Double)] = ["Moscow": (lon: 37.618423, lat: 55.751244),
//                                                                     "Kazan": (lon: 49.108891, lat: 55.796391),
//                                                                     "Samara": (lon: 50.221245, lat: 53.241505),
//                                                                     "Rostov-na-Donu": (lon: 39.715, lat: 47.2332),
//                                                                     "Kiev": (lon: 30.5238, lat: 50.45466),
//                                                                     "Saint Petersburg": (lon: 30.3350986, lat: 59.9342802),
//                                                                     "Nizhniy Novgorod": (lon: 44.0092, lat: 56.3299),
//                                                                     "Omsk": (lon: 73.36859, lat: 54.99244),
//                                                                     "Kaliningrad": (lon: 20.51095, lat: 54.70649),
//                                                                     "Yekaterinburg": (lon: 60.6122, lat: 56.8519),
//                                                                     "Ufa": (lon: 55.96779, lat: 54.74306)]
    
    @State var locationManager = LocationManager()
    private let leadingNavPadding: CGFloat = 20
    
    private func getCity(for cityName: String) -> City {
        for city in popularCities {
            if (cityName == city.name) {
                return city
            }
        }
        return City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244))
    }
    
    var body: some View {
        if mapChoosed {
            VStack {
                HStack() {
                    TextField(Localization.enterLocation.localized, text: $location)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: AppImage.magnifyingglass.rawValue)
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                if isEditing {
                                    Button(action: {
                                        self.location = ""
                                        self.isEditing = false
                                    }) {
                                        Image(systemName: AppImage.multipleCircleFill.rawValue)
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.location = ""
                        }) { //TODO анимация правой стороы TF
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
                if isEditing {
                    SearchResultTable(cities: $popularCities,
                                      location: $location,
                                      selectedCity: $selectedCityName,
                                      isEditing: $isEditing,
                                      isMapSearch: true)
                } else {
                    GoogleMapsView(city: $selectedCity).edgesIgnoringSafeArea(.all)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                        IconStruct.getImage(with: AppImage.leftChevron.rawValue, color: .black)
                                        Text(Localization.locations.localized)
                                            .fontWeight(.regular)
                                    }, trailing:
                                    Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                        IconStruct.getImage(with: AppImage.plus.rawValue, color: .black)
                                            .padding(.leading, MagicSpacer.x4)
                                    }
            )
        }
        else {
            GeometryReader { geometry in
                VStack {
                    Divider()
                    if !isEditing {
                        VStack(alignment: .center) {
                            HStack {
                                Text(Localization.popularCities.localized).modifier(HeadText())
                                Spacer()
                            }
                            BreadcrumbsSubview(cities: $popularCities, selectedCity: $selectedCityName)
                            Divider()
                                .padding(.top, MagicSpacer.x4)
                            HStack {
                                Button(action: { mapChoosed.toggle() }) {
                                    Text(Localization.showMap.localized)
                                        .modifier(LinkText())
                                }
                                Spacer()
                            }
                            .padding(.top, MagicSpacer.x4)
                            Spacer()
                        }
                        .padding([.top, .horizontal], MagicSpacer.x4)
                    } else {
                        SearchResultTable(cities: $popularCities,
                                          location: $location,
                                          selectedCity: $selectedCityName,
                                          isEditing: $isEditing,
                                          isMapSearch: false)
                    }
                }
                .modifier(ClearNavigationBar())
                .navigationBarItems(leading:
                                        HStack {
                                            Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                                IconStruct.getImage(with: AppImage.leftChevron.rawValue, color: .black)
                                                    .padding(.leading, leadingNavPadding)
                                            }
                                            SearchBar(location: $location, isEditing: $isEditing)
                                        }
                                        .frame(width: geometry.size.width)
                )
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(selectedCityName: .constant("Moscow"))
    }
}
