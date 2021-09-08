//
//  TextStyles.swift
//  Weather
//
//  Created by Iskander Nizamov on 26.08.2021.
//

import SwiftUI

struct CityHeader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color(.clear))
    }
}

struct MainTemperature: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 80, weight: .thin, design: .default))
            .foregroundColor(.white)
            .background(Color(.clear))
            .padding(.all, 0.0)
            .frame(height: 72.0, alignment: .center)
    }
}

struct SecondaryWhiteText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 12, weight: .regular, design: .default))
            .foregroundColor(.white)
            .background(Color(.clear))
    }
}

struct DateGrayText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 13, weight: .regular, design: .default))
            .foregroundColor(.gray)
            .background(Color(.clear))
    }
}

struct DateMainText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 17, weight: .regular, design: .default))
            .foregroundColor(.black)
            .background(Color(.clear))
    }
}

struct TemperatureDark: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 22, weight: .regular, design: .default))
            .foregroundColor(.black)
            .background(Color(.clear))
    }
}

struct TemperatureGray: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 17, weight: .regular, design: .default))
            .foregroundColor(.gray)
            .background(Color(.clear))
    }
}

struct TemperatureLocationDark: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 34, weight: .regular, design: .default))
            .foregroundColor(.black)
            .background(Color(.clear))
    }
}

struct LocationDescription: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 12, weight: .regular, design: .default))
            .foregroundColor(.gray)
            .background(Color(.clear))
    }
}

struct TemperatureLocationGray: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 16, weight: .regular, design: .default))
            .foregroundColor(.gray)
            .background(Color(.clear))
    }
}

struct LinkText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 17, weight: .regular, design: .default))
            .foregroundColor(.blue)
            .background(Color(.clear))
            .padding(.leading, MagicSpacer.x1 )
    }
}

struct HeadText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 17, weight: .semibold, design: .default))
            .foregroundColor(.black)
            .background(Color(.clear))
    }
}

struct CityBreadcrumbText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 13, weight: .regular, design: .default))
            .foregroundColor(.black)
            .background(Color(.clear))
    }
}

struct CitySearchResultText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 15, weight: .regular, design: .default))
            .foregroundColor(.black)
            .background(Color(.clear))
    }
}
