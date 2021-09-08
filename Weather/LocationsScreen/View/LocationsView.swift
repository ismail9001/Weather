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
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.citiesForecast) { city in
                    LocationCellView(cityModel: city, isEditing: $isEditing) {
                        viewModel.deleteLocation(location: city)
                    }
                    .onTapGesture {
                        viewModel.selectCity(with: city.cityName) // Nikite показать решение
                        NavigationCoordinator.popToRootView()
                    }
                }
            }.padding(.top, MagicSpacer.x3)
        }
        .modifier(ClearNavigationBar())
        .navigationTitle(Localization.locations.localized)
        .navigationBarItems(leading:
                                Button(action: {self.presentationMode.wrappedValue.dismiss() }) { IconView(name: AppImage.leftChevron, color: .black)},
                            trailing: Button(action: {
                                isEditing.toggle()
                            }) { if !isEditing {
                                IconView(name: AppImage.squareAndPencil, color: .black)
                            } else {
                                IconView(name: AppImage.checkMark, color: .black)
                            }
                            })
        .onAppear(perform: viewModel.startFetchingData)
        HStack {
            NavigationLink(destination: ViewFactory.buildView(for: .search(selectedCity: $viewModel.selectedCity))) {
                HStack {
                    IconView(name: AppImage.plusCircle, fontSize: 17, color: .blue)
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
        LocationsView(viewModel: LocationsViewModel(networkService: networkService, selectedCity: .constant("Moscow")))
    }
}
