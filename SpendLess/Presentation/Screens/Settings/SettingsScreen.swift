//
//  SettingsScreen.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack(spacing: 30) {
            
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        SettingsScreen()
            .environment(Router())
    }
}
