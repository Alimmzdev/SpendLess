# SpendLess

SpendLess is a SwiftUI app to help you manage costs and spend less. It’s designed as a modern, adaptive, multiplatform app for the Apple ecosystem.

- Platforms: iOS, iPadOS
- Tech stack: SwiftUI, Observation (@Observable), NavigationStack, Swift Concurrency–ready
- Architecture: Custom Router with per-tab navigation paths, adaptive Tab Bar (iPhone) and Sidebar (iPad)

## Features (Current)

- Adaptive navigation:
  - iPhone: Custom bottom tab bar
  - iPad: Collapsible sidebar
- Per-tab navigation with independent NavigationPaths
- Simple routing via AppRoute and Tab enums
- Clean previews and test scaffolding

This repository is a solid foundation to build a cost management app with clear navigation and structure. Extend it with budgeting, transactions, categories, analytics, and more.

## Project Structure

- SpendLessApp.swift
  - App entry point. Injects a shared Router into the environment and loads MainTabView.

- MainTabView.swift
  - Hosts the adaptive shell: a sidebar on iPad, a custom tab bar on iPhone.
  - Manages the selected tab and sets up a NavigationStack bound to the Router’s per-tab path.
  - Defines root views and destinations for AppRoute.

- Router.swift
  - @Observable Router that holds:
    - A NavigationPath per Tab
    - A logical route stack per Tab (AppRoute array)
  - Public API:
    - push(_ route: AppRoute, in tab: Tab)
    - pop(in tab: Tab)
    - popToRoot(in tab: Tab)
    - currentRoute(in tab: Tab) -> AppRoute?
    - path(for tab: Tab) -> Binding<NavigationPath>
    - resetAll()

- AppRouter.swift
  - AppRoute enum (Hashable): .home, .settings, .profile

- Tab.swift
  - Tab enum (CaseIterable, Hashable) with SF Symbols raw values and a title for UI.

- Screens
  - HomeScreen.swift
  - ProfileScreen.swift
  - SettingsScreen.swift
  - Each screen uses @Environment(Router.self) and sets a navigation title.

- UI Components
  - CustomTabBar.swift
    - Bottom tab bar for iPhone with SF Symbol icons and titles.
  - CustomSideBar.swift
    - Collapsible sidebar for iPad with the same tabs and titles.
  - ViewExtenstions.swift
    - ifCondition helper to conditionally transform a view.

- Tests
  - SpendLessTests.swift (Swift Testing)
  - SpendLessUITests.swift and SpendLessUITestsLaunchTests.swift (XCTest)

## Navigation Overview

SpendLess uses a custom Router to manage NavigationStack paths independently for each tab. This allows users to switch tabs without losing navigation state in each tab.

- Push a route:
  ```swift
  router.push(.settings, in: .home)
