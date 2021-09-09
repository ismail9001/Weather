//
//  MapView.swift
//  Weather
//
//  Created by Iskander Nizamov on 07.09.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    init(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Map(coordinateRegion: $viewModel.coordinateRegion, annotationItems: viewModel.annotation){
            city in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon))
        }
    }
}
