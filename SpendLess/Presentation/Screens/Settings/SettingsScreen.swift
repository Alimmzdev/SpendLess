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
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Back") {
                router.pop(in: .settings) // تب مشخص شد
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsScreen()
            .environment(Router())
    }
}
