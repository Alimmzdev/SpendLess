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
            NavigationStack(path: router.path(for: selectedTab)) {
                rootView(for: selectedTab)
                    .navigationDestination(for: AppRoute.self) { route in
                        destination(for: route)
                    }
            }
            // Make sure each time the tab changes, its stack is reset
            .onChange(of: selectedTab) { _, newTab in
                router.popToRoot(in: newTab)
            }
            .onAppear {
                router.popToRoot(in: selectedTab)
            }

            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
    }

    // MARK: - Root Views
    @ViewBuilder
    private func rootView(for tab: Tab) -> some View {
        switch tab {
        case .home:
            HomeScreen()
        case .profile:
            ProfileScreen()
        case .settings:
            SettingsScreen()
        }
    }

    // MARK: - Destination Views
    @ViewBuilder
    private func destination(for route: AppRoute) -> some View {
        switch route {
        case .home:
            HomeScreen()
        case .profile:
            ProfileScreen()
        case .settings:
            SettingsScreen()
        }
    }
}

#Preview {
    MainTabView()
        .environment(Router())
}
