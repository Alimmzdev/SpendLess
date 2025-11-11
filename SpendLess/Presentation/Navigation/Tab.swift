//
//  Tab.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import Foundation

enum Tab: String, CaseIterable, Hashable {
    case home = "house"
    case reports = "chart.bar.xaxis"
    case budgets = "wallet.bifold.fill"
    case profile = "person.crop.circle"
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .profile: return "Profile"
        case .budgets: return "Budgets"
        case .reports: return "Reports"
        }
    }
}
