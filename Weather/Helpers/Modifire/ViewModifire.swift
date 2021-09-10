//
//  File.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import SwiftUI

struct LocationCell: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, MagicSpacer.x2)
            .padding(.horizontal, MagicSpacer.x4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.vertical, MagicSpacer.x05)
            .padding(.horizontal, MagicSpacer.x4)
            .background(CustomColor.backgroundColor)
    }
}

struct ListSeparatorStyle: ViewModifier {
    
    let style: UITableViewCell.SeparatorStyle
    
    func body(content: Content) -> some View {
        content
            .onAppear() {
                UITableView.appearance().separatorStyle = self.style
            }
    }
}

struct NavigationBarModifier: ViewModifier {
  var backgroundColor: UIColor
  var textColor: UIColor

  init(backgroundColor: UIColor, textColor: UIColor) {
    self.backgroundColor = backgroundColor
    self.textColor = textColor
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = .clear
    coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = textColor
  }

  func body(content: Content) -> some View {
    ZStack{
       content
        VStack {
          GeometryReader { geometry in
             Color(self.backgroundColor)
                .frame(height: geometry.safeAreaInsets.top)
                .edgesIgnoringSafeArea(.top)
              Spacer()
          }
        }
     }
  }
}

struct CityBreadcrumb: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, MagicSpacer.x2)
            .padding(.horizontal, MagicSpacer.x4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.vertical, MagicSpacer.x05)
            .padding(.horizontal, MagicSpacer.x4)
    }
}

struct DeleteButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, MagicSpacer.x2 )
    }
}

struct ClearNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarColor(UIColor(CustomColor.backgroundColor), textColor: UIColor(CustomColor.textColor))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
    }
}
