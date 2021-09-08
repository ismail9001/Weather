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
    @State private var isEditing = false
    @State private var mapChoosed = false
    private let leadingNavPadding: CGFloat = 20
    
    var body: some View {
        if mapChoosed {
            VStack {
                HStack() {
                    TextField(Localization.enterLocation.localized, text: $searchLocation)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                IconView(name: AppImage.magnifyingglass, color: .gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                if isEditing {
                                    Button(action: {
                                        self.searchLocation = ""
                                        self.isEditing = false
                                    }) {
                                        Image(systemName: AppImage.multipleCircleFill.rawValue)
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.searchLocation = ""
                        }) { //TODO анимация правой стороы TF
                            Text(Localization.cancel.localized)
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
                ZStack {
                    SearchResultTable(cities: viewModel.popularCities,
                                      searchLocation: $searchLocation,
                                      selectedCity: $viewModel.selectedCityName,
                                      isEditing: $isEditing,
                                      bottomSheetShown: $viewModel.bottomSheetShown,
                                      isMapSearch: true,
                                      viewModel: viewModel)
                    ZStack {
                        MapView(viewModel)
                            .ignoresSafeArea()
                        BottomSheetView(isOpen: $viewModel.bottomSheetShown, maxHeight: 200) {
                            SelectedCityBottomSheetView(viewModel: viewModel)
                        }.edgesIgnoringSafeArea(.all)
                    }.opacity(isEditing ? 0 : 1)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                        IconView(name: AppImage.leftChevron, color: .black)
                                        Text(Localization.locations.localized)
                                            .fontWeight(.regular)
                                    }, trailing:
                                        Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                            IconView(name: AppImage.plus, color: .black)
                                                .padding(.leading, MagicSpacer.x4)
                                        }
            )
        }
        else {
            GeometryReader { geometry in
                VStack {
                    Divider()
                    if !isEditing {
                        VStack(alignment: .center) {
                            HStack {
                                Text(Localization.popularCities.localized).modifier(HeadText())
                                Spacer()
                            }
                            BreadcrumbsSubview(cities: viewModel.popularCities, selectedCity: $viewModel.selectedCityName)
                            Divider()
                                .padding(.top, MagicSpacer.x4)
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
                        SearchResultTable(cities: viewModel.popularCities,
                                          searchLocation: $searchLocation,
                                          selectedCity: $viewModel.selectedCityName,
                                          isEditing: $isEditing,
                                          bottomSheetShown: $viewModel.bottomSheetShown,
                                          isMapSearch: false,
                                          viewModel: viewModel)
                    }
                }
                .modifier(ClearNavigationBar())
                .navigationBarItems(leading:
                                        HStack {
                                            Button(action: {self.presentationMode.wrappedValue.dismiss() }) {
                                                IconView(name: AppImage.leftChevron, color: .black)
                                                    .padding(.leading, leadingNavPadding)
                                            }
                                            SearchBar(location: $searchLocation, isEditing: $isEditing)
                                        }
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
