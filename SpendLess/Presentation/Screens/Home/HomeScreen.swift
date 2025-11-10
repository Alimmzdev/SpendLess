//
//  HomeScreen.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack(spacing: 30) {
        
        }
        .padding()
        .navigationTitle("Home")
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
            .environment(Router())
    }
}
