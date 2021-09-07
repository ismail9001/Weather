//
//  GoogleMapsView.swift
//  Weather
//
//  Created by Iskander Nizamov on 06.09.2021.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    @Binding var city: City
    private let zoom: Float = 10.0
    let marker : GMSMarker = GMSMarker()
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: city.coord.lat, longitude: city.coord.lon, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        marker.position = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        marker.title = city.name
        marker.snippet = "Russia"
        marker.map = mapView
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
            //        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
            //        mapView.camera = camera
//            marker.position = CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude)
//            marker.title = "Moscow"
//            marker.snippet = "Russia"
//            marker.map = uiView
//            uiView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
    }
    
//    func showCity(with coordinates: (lat: Double, lon: Double)) {
//        let coordinate = CLLocationCoordinate2D(latitude: coordinates.lat,
//                                                longitude: coordinates.lon)
//        addMarker(at: coordinate)
//        let camera = GMSCameraPosition(target: coordinate, zoom: 17)
//        mapView.animate(to: camera)
//    }
//    
//    private func addMarker(at coordinate: CLLocationCoordinate2D) {
//        let marker = GMSMarker(position: coordinate)
//        marker.map = mapView
//    }
    
}

//struct GoogleMapsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoogleMapsView()
//    }
//}
