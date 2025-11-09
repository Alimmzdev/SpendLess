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
            Text("Home Screen")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                Button("Go to Profile") {
                    router.push(.profile, in: .home) // تب مشخص شد
                }
                .buttonStyle(.borderedProminent)
                
                Button("Go to Settings") {
                    router.push(.settings, in: .home)
                }
                .buttonStyle(.bordered)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
            .environment(Router()) // برای پیش‌نمایش
    }
}
