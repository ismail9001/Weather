//
//  String.swift
//  Weather
//
//  Created by Iskander Nizamov on 27.08.2021.
//

import Foundation

extension Date {
    func getDate(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let date = dateFormatter.string(from: self)
        return date.capitalized
    }
}
