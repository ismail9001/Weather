//
//  WeatherForecastView.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import SwiftUI

struct WeatherForecastView: View {
    
    @StateObject var viewModel: WeatherForecastViewModel
    @State var isScrolled = true
    
    var hourlyForecastSubviewHeight: CGFloat = 88
    
    var dailyForecastTopPadding: CGFloat {
        return isScrolled ? 0 : 0.0 - hourlyForecastSubviewHeight
    }
    var headerHeight: CGFloat = 240.0
    
    var body: some View {
//        if viewModel.isLoading == true {
//            ProgressView()
//        } else {
        NavigationView {
            VStack {
                ZStack {
                    Image("cloudy-background")
                        .resizable()
                        .ignoresSafeArea()
                    VStack {
                        MainInfoSubView(cityForecast: $viewModel.cityForecast, selectedCity: $viewModel.selectedCity)
                        HStack {
                            Spacer()
                            ShortPanelView(cityForecast: $viewModel.cityForecast)
                            Spacer()
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: MagicSpacer.x2){
                                    ForEach(0 ..< 10) { i in
                                        let hour = Calendar.current.component(.hour, from: Date()) + i
                                        if hour < 25 {
                                            HourlyForecastCellView(hour: String(hour))
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: hourlyForecastSubviewHeight)
                    }
                }
                .frame(height: headerHeight)
                DailyForecastView(forecasts: viewModel.dailyForecasts, isScrolled: $isScrolled)
                    .padding(.top, dailyForecastTopPadding)
                    .onAppear(perform: viewModel.startFetchingData)
                    .animation(.easeInOut(duration: 0.2), value: isScrolled)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
//        }
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView(viewModel: WeatherForecastViewModel(networkService: DIContainer.shared.networkService))
    }
}
