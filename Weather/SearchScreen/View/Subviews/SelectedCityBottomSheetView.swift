//
//  SelectedCityBottomSheetView.swift
//  Weather
//
//  Created by Iskander Nizamov on 08.09.2021.
//

import SwiftUI

struct SelectedCityBottomSheetView: View {
    
    @StateObject var viewModel: SearchViewModel
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: MagicSpacer.x05) {
                    if !viewModel.selectedCity.cityName.isEmpty { Text(viewModel.selectedCity.cityName).modifier(DateMainText())}
                    Text(viewModel.selectedCity.description).modifier(LocationDescription())
                }
                .padding(.leading, MagicSpacer.x4)
                Spacer()
                IconView(name: AppImage.withLabel(viewModel.selectedCity.weather), fontSize: 24, color: .gray)
                Text(viewModel.selectedCity.temperature)
                    .modifier(TemperatureLocationDark())
                    .padding(.leading, MagicSpacer.x3)
                    .padding(.trailing, MagicSpacer.x4)
            }
            HStack(spacing: MagicSpacer.x4) {
                Spacer()
                Button(action: {
                    viewModel.bottomSheetShown = false
                }) {
                    Text(Localization.cancel.localized)
                        .modifier(TemperatureGray())
                }
                .padding(.all, MagicSpacer.x2)
                Button(action: {
                    viewModel.updateSelectedCity()
                    NavigationCoordinator.popToRootView()
                }) {
                    Text(Localization.add.localized)
                        .modifier(LinkText())
                }
                .padding(.all, MagicSpacer.x2)
            }
            .padding(.top, 18)
            .padding(.bottom, 60)
            .padding(.trailing, MagicSpacer.x4)
        }
    }
}

struct SelectedCityBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCityBottomSheetView(viewModel: SearchViewModel(selectedCityName: .constant("Moscow"), networkService: DIContainer.shared.networkService, locService: DIContainer.shared.locationService))
    }
}
