//
//  IconView.swift
//  Weather
//
//  Created by Iskander Nizamov on 30.08.2021.
//

import SwiftUI

struct IconView: View {
    
    var name: AppImage
    var fontSize: CGFloat = 15
    var color: Color = .white
    
    var body: some View {
        Image(systemName: name.rawValue)
            .font(.system(size: fontSize))
            .foregroundColor(name == .clear ? .yellow : color)
    }
}
