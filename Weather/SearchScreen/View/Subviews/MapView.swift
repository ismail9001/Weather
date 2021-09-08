//
//  MapView.swift
//  Weather
//
//  Created by Iskander Nizamov on 07.09.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var cities: [City] = [City(name: "Moscow", coord: Coordinate(lon: 37.618423, lat: 55.751244))]
        //City(name: "Kazan", coord: Coordinate(lon: 49.108891, lat: 55.796391)),
        //City(name: "Samara", coord: Coordinate(lon: 50.221245, lat: 53.241505))
    

    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: cities) { city in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon))
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
