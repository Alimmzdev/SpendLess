//
//  CustomTabBar.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: tab.rawValue)
                                .font(.system(size: 20))
                            Text(tab.title)
                                .font(.caption2)
                        }
                        .padding([.bottom, .horizontal])
                        .padding(.top, 2)
                        .foregroundStyle(selectedTab == tab ? .appPrimary : .gray)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedTab: Tab = .home

    ZStack {
        Color(.systemGroupedBackground)
            .ignoresSafeArea()

        VStack {
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}
