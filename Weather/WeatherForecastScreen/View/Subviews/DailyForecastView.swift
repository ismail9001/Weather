//
//  DailyForecastView.swift
//  Weather
//
//  Created by Iskander Nizamov on 27.08.2021.
//

import SwiftUI

struct DailyForecastView: View {
    
    var forecasts: [DailyForecast]
    @State private var offset = CGFloat.zero
    @Binding var isScrolled: Bool
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    ForEach(forecasts, id: \.id) { forecast in
                        DailyForecastCellView(forecast: forecast)
                        Divider()
                    }
                }.background(Color.white)
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .named("scroll")).origin.y
                    Color.clear.preference(key: ViewOffsetKey.self, value: offset)
                }
            }
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ViewOffsetKey.self) { (value: ViewOffsetKey.Value) in
            isScrolled = value < 0.0 ? false : true
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(forecasts: testData, isScrolled: .constant(false))
    }
}
