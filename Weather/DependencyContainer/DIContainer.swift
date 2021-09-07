//
//  DIContainer.swift
//  Weather
//
//  Created by Iskander Nizamov on 01.09.2021.
//

import SwiftUI

final class DIContainer {
    
    static let shared = DIContainer()
    
    lazy var networkService = NetworkService.shared
}
