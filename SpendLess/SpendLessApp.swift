//
//  SpendLessApp.swift
//  SpendLess
//
//  Created by Alimmz on 11/6/25.
//

import SwiftUI
import SwiftData

@main
struct SpendLessApp: App {
    @State private var router = Router()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(router)
        }
    }
}
