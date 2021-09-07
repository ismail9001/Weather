//
//  LocationsView.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import SwiftUI

struct LocationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: LocationsViewModel
    @State var isEditing = false
    @State var selection: Int? = nil
    @Binding var selectedCity: String
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.citiesForecast) { city in
                    LocationCellView(cityModel: city, isEditing: $isEditing) {
                        viewModel.deleteLocation(location: city)
                    }
                    .onTapGesture {
                        selectedCity = city.cityName
                        NavigationCoordinator.popToRootView()
                    }
                }
            }.padding(.top, MagicSpacer.x3)
        }
        .modifier(ClearNavigationBar())
        .navigationTitle(Localization.locations.localized)
        .navigationBarItems(leading:
                                Button(action: {self.presentationMode.wrappedValue.dismiss() }) { IconStruct.getImage(with: AppImage.leftChevron.rawValue, color: .black)},
                            trailing: Button(action: {
                                isEditing.toggle()
                            }) { if !isEditing {
                                IconStruct.getImage(with: AppImage.squareAndPencil.rawValue, color: .black)
                            } else {
                                IconStruct.getImage(with: AppImage.checkMark.rawValue, color: .black)
                            }
                            })
        .onAppear(perform: viewModel.startFetchingData)
        HStack {
            NavigationLink(destination: ViewFactory.buildView(for: .search(selectedCity: $selectedCity))) {
                HStack {
                    IconStruct.getImage(with: AppImage.plusCircle.rawValue, size: 17, color: .blue)
                    Text(Localization.addLocation.localized).modifier(LinkText())
                }
                .padding(.leading, MagicSpacer.x4)
            }
            Spacer()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        let networkService = DIContainer.shared.networkService
        LocationsView(viewModel: LocationsViewModel(networkService: networkService), selectedCity: .constant("Moscow"))
    }
}
