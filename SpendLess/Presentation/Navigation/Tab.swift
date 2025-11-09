//
//  Tab.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import Foundation

enum Tab: String, CaseIterable, Hashable {
    case home = "house"
    case profile = "person.crop.circle"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .profile: return "Profile"
        case .settings: return "Settings"
        }
    }
}
