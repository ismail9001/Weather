//
//  WeatherApp.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    var body: some Scene {
        WindowGroup {
            ViewFactory.buildView(for: .forecast)
        }
    }
}
