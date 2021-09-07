//
//  SearchBar.swift
//  Weather
//
//  Created by Iskander Nizamov on 03.09.2021.
//

import SwiftUI

import Combine

struct SearchBar: View {
    
    @Binding var location: String
    @Binding var isEditing: Bool
    
    var body: some View {
        TextField(Localization.enterLocation.localized, text: $location)
            .padding(7)
            .onReceive(Just(location)) { location in
                isEditing = !location.isEmpty
            }
            .overlay(
                HStack {
                    if isEditing {
                        Spacer()
                        Button(action: {
                            self.location = ""
                        }) {
                            IconStruct.getImage(with: AppImage.multiply.rawValue, size: 17, color: .black)
                        }
                    } else {
                        
                    }
                }
            )
            .padding(.trailing, MagicSpacer.x4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(location: .constant(""), isEditing: .constant(false))
    }
}
