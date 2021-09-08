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
            .onReceive(Just(location)) { location in //убрать JUST  searchbar uikit
                isEditing = !location.isEmpty
            }
            .overlay(
                HStack {
                    Spacer()
                        Button(action: {
                            self.location = ""
                        }) {
                            IconView(name: AppImage.multiply, fontSize: 17, color: .black)
                        }
                        .disabled(!isEditing)
                        .opacity(isEditing ? 1 : 0)
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
