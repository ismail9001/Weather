//
//  SearchView.swift
//  Weather
//
//  Created by Iskander Nizamov on 02.09.2021.
//

import SwiftUI
import Combine
import MapKit

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SearchViewModel
    @State var searchLocation: String = ""
    @State private var mapChoosed = false
    private let leadingNavPadding: CGFloat = 20
    
    var body: some View {
        GeometryReader { geometry in
            if mapChoosed {
            VStack(spacing: 0) {
                HStack() {
                    SearchBar(text: $searchLocation, placeholder: $viewModel.placeholder)
                }
                ZStack {
                    SearchResultTable(searchLocation: $searchLocation,
                                      bottomSheetShown: $viewModel.bottomSheetShown,
                                      isMapSearch: $mapChoosed,
                                      viewModel: viewModel)
                    ZStack {
                        MapView(viewModel)
                        BottomSheetView(isOpen: $viewModel.bottomSheetShown, maxHeight: 200) { //ot contenta
                            SelectedCityBottomSheetView(viewModel: viewModel)
                        }
                    }
                    .edgesIgnoringSafeArea(.vertical)
                    .opacity(searchLocation.isEmpty ? 1 : 0)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                            IconView(name: AppImage.leftChevron, color: CustomColor.darkIconColor)
                                            Text(Localization.locations.localized)
                                                .fontWeight(.regular)
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal, MagicSpacer.x4)
                                    .frame(width: geometry.size.width)
            )
        }
        else {
                VStack {
                    Divider()
                        .background(Color.gray)
                    if self.searchLocation.isEmpty {
                        VStack(alignment: .center) {
                            HStack {
                                Text(Localization.popularCities.localized).modifier(HeadText())
                                Spacer()
                            }
                            BreadcrumbsSubview(cities: viewModel.popularCities, selectedCity: $viewModel.selectedCityName)
                            Divider()
                                .background(Color.gray)
                                .padding(.top, MagicSpacer.x2)
                            HStack {
                                Button(action: { mapChoosed.toggle() }) {
                                    Text(Localization.showMap.localized)
                                        .modifier(LinkText())
                                }
                                Spacer()
                            }
                            .padding(.top, MagicSpacer.x4)
                            Spacer()
                        }
                        .padding([.top, .horizontal], MagicSpacer.x4)
                    } else {
                        SearchResultTable(searchLocation: $searchLocation,
                                          bottomSheetShown: $viewModel.bottomSheetShown,
                                          isMapSearch: $mapChoosed,
                                          viewModel: viewModel)
                    }
                }
                .modifier(ClearNavigationBar())
                .navigationBarItems(leading:
                                        HStack {
                                            Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                                IconView(name: AppImage.leftChevron, color: CustomColor.darkIconColor)
                                            }
                                            SearchBar(text: $searchLocation, placeholder: $viewModel.placeholder)
                                        }
                                        .padding(.horizontal, MagicSpacer.x4)
                                        .frame(width: geometry.size.width)
                )
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(selectedCity: .constant("Moscow"), networkService: DIContainer.shared.networkService))
    }
}
