//
//  MapView.swift
//  Weather
//
//  Created by Iskander Nizamov on 07.09.2021.
//

import SwiftUI
import MapKit

//struct MapView: View {
//    @ObservedObject var viewModel: SearchViewModel
//
//    init(_ viewModel: SearchViewModel) {
//        self.viewModel = viewModel
//    }
//
//    var body: some View {
//        Map(coordinateRegion: $viewModel.coordinateRegion, annotationItems: viewModel.annotation){
//            city in
//            MapMarker(coordinate: CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon))
//        }
//    }
//}


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @ObservedObject var viewModel: SearchViewModel
    @State private var myMapView: MKMapView?
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var mapView: MapView
        @ObservedObject var viewModel: SearchViewModel
        
        init(_ control: MapView, _ viewModel: SearchViewModel) {
            self.mapView = control
            self.viewModel = viewModel
        }
        
        @objc func addAnnotationOnTapGesture(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                let point = sender.location(in: mapView.myMapView)
                let coordinate = mapView.myMapView?.convert(point, toCoordinateFrom: mapView.myMapView)
                guard let lat = coordinate?.latitude, let lon = coordinate?.longitude else { return }
                viewModel.getDataByCoord(lat: lat, lon: lon)
            }
        }
        
        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewModel)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(viewModel.coordinateRegion, animated: false)
        DispatchQueue.main.async {
                    self.myMapView = mapView
        }
        
        let gRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.addAnnotationOnTapGesture(sender:)))
        mapView.addGestureRecognizer(gRecognizer)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let annotations = view.annotations
        view.removeAnnotations(annotations)
        view.setRegion(viewModel.coordinateRegion, animated: false)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: viewModel.selectedCity.coord.lat, longitude: viewModel.selectedCity.coord.lon)
        view.addAnnotation(annotation)
    }
}
