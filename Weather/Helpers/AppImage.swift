//
//  AppImage.swift
//  Weather
//
//  Created by Iskander Nizamov on 30.08.2021.
//

import Foundation

enum AppImage: String, CaseIterable {
    case list = "list.bullet"
    case leftArrow = "arrow.left"
    case leftChevron = "chevron.left"
    case squareAndPencil = "square.and.pencil"
    case mapPin = "mappin.and.ellipse"
    case multiply = "multiply"
    case checkMark = "checkmark"
    case plus = "plus"
    case plusCircle = "plus.circle.fill"
    case multipleCircleFill = "multiply.circle.fill"
    case magnifyingglass = "magnifyingglass"
    
    //Weather
    case smoke = "smoke.fill"
    case cloud = "cloud.fill"
    case rain = "cloud.rain.fill"
    case snow = "cloud.snow.fill"
    case clear = "sun.max.fill"
    case wind = "wind"
    case drop = "drop"
    case compass = "safari"
    
    static func withLabel(_ label: String) -> AppImage {
        let value = self.allCases.first{ "\($0)" == label.lowercased() }
        guard let value = value else { return AppImage.smoke }
        return value
    }
}
