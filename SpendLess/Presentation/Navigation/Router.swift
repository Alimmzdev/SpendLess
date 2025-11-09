//
//  Router.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import SwiftUI
import Observation

@Observable
final class Router {
    private var paths: [Tab: NavigationPath] = [:]
    private var routeStacks: [Tab: [AppRoute]] = [:]
    
    init() {
        // Start with empty paths (no default route to prevent duplicate screens)
        Tab.allCases.forEach { tab in
            paths[tab] = NavigationPath()
            routeStacks[tab] = []
        }
    }
    
    // MARK: - Navigation actions
    
    func push(_ route: AppRoute, in tab: Tab) {
        if paths[tab] == nil { paths[tab] = NavigationPath() }
        routeStacks[tab, default: []].append(route)
        paths[tab]?.append(route)
    }
    
    func pop(in tab: Tab) {
        routeStacks[tab]?.popLast()
        if var path = paths[tab], !path.isEmpty {
            path.removeLast()
            paths[tab] = path
        }
    }
    
    func popToRoot(in tab: Tab) {
        // Clears the navigation path completely
        paths[tab] = NavigationPath()
        routeStacks[tab] = []
    }
    
    func currentRoute(in tab: Tab) -> AppRoute? {
        routeStacks[tab]?.last
    }
    
    func path(for tab: Tab) -> Binding<NavigationPath> {
        Binding(
            get: { [weak self] in self?.paths[tab] ?? NavigationPath() },
            set: { [weak self] newPath in self?.paths[tab] = newPath }
        )
    }
    
    func resetAll() {
        Tab.allCases.forEach { tab in
            paths[tab] = NavigationPath()
            routeStacks[tab] = []
        }
    }
}
