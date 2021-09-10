//
//  AppBackground.swift
//  Weather
//
//  Created by Iskander Nizamov on 09.09.2021.
//

enum AppBackground: String, CaseIterable {
    case cloud = "cloud-background"
    case rain = "rain-background"
    case clear = "sun-background"
    
    static func withCase(_ label: String) -> String {
        let value = self.allCases.first{ "\($0)" == label.lowercased() }
        if let value = value {
            return value.rawValue
        } else { return AppBackground.cloud.rawValue }
    }
}
