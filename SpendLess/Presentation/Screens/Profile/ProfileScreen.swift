//
//  ProfileScreen.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import SwiftUI

struct ProfileScreen: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Go Back") {
                router.pop(in: .profile) // تب مشخص شد
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProfileScreen()
            .environment(Router())
    }
}
