//
//  MainTabView.swift
//  SpendLess
//
//  Created by Alimmz on 11/6/25.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @Environment(Router.self) private var router
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            HStack(spacing: 0) {
                if shouldShowSidebar {
                    CustomSideBar(selectedTab: $selectedTab)
                }

                NavigationStack(path: router.path(for: selectedTab)) {
                    rootView(for: selectedTab)
                        .navigationDestination(for: AppRoute.self) { route in
                            destination(for: route)
                        }
                }
                .onAppear { router.popToRoot(in: selectedTab) }
                .onChange(of: selectedTab) { _, newTab in
                    router.popToRoot(in: newTab)
                }
            }

            if shouldShowTabBar {
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }

    private var shouldShowSidebar: Bool {
        #if os(iOS)
        UIDevice.current.userInterfaceIdiom == .pad
        #elseif os(macOS)
        true
        #else
        false
        #endif
    }

    private var shouldShowTabBar: Bool {
        #if os(iOS)
        UIDevice.current.userInterfaceIdiom == .phone
        #else
        false
        #endif
    }

    @ViewBuilder
    private func rootView(for tab: Tab) -> some View {
        switch tab {
        case .home: HomeScreen()
        case .profile: ProfileScreen()
        case .settings: SettingsScreen()
        }
    }

    @ViewBuilder
    private func destination(for route: AppRoute) -> some View {
        switch route {
        case .home: HomeScreen()
        case .profile: ProfileScreen()
        case .settings: SettingsScreen()
        }
    }
}

#Preview {
    MainTabView()
        .environment(Router())
}
