//
//  IconStruct.swift
//  Weather
//
//  Created by Iskander Nizamov on 30.08.2021.
//

import SwiftUI

struct IconStruct {
    static func getImage(with: String, size: CGFloat = 15, color: Color = .white) -> some View {
        let image = Image(systemName: with)
            .foregroundColor(color)
            .font(.system(size: size))
        return image
    }
}
