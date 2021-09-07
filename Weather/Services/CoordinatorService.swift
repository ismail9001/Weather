//
//  CoordinatorService.swift
//  Weather
//
//  Created by Iskander Nizamov on 31.08.2021.
//

import SwiftUI

class NavigationCoordinator: ObservableObject {

    fileprivate var screen: AnyView = AnyView(EmptyView())

    @Published fileprivate var shouldNavigate: Bool = false

    func show<V: View>(_ view: V) {
        let wrapped = AnyView(view)
        screen = wrapped
        shouldNavigate = true
    }
}

struct NavigationWrapper<Content>: View where Content: View {

    @EnvironmentObject var coordinator: NavigationCoordinator

    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        NavigationView {

            if coordinator.shouldNavigate {
                NavigationLink(
                    destination: coordinator.screen,
                    isActive: $coordinator.shouldNavigate,
                    label: {
                        content
                    })
            } else {
                content
            }
        }

        .onDisappear(perform: {
            coordinator.shouldNavigate = false
        })
    }
}
