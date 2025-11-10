//
//  CustomSideBar.swift
//  SpendLess
//
//  Created by Alimmz on 11/10/25.
//

import SwiftUI

struct CustomSideBar: View {
    @Binding var selectedTab: Tab
    @State private var isCollapsed: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    if !isCollapsed {
                        Text("SpendLess")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        Spacer()
                    }
                    Button(action: {
                        withAnimation(.spring()) {
                            isCollapsed.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .rotationEffect(.degrees(isCollapsed ? 180 : 0))
                            .animation(.spring(), value: isCollapsed)
                            .tint(.appPrimary)
                            .padding()
                    }
                    .background(.appPrimary.opacity(0.1))
                    .clipShape(Circle())
                }
                Spacer()
                    .frame(maxHeight: 32)
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Button {
                                selectedTab = tab
                            } label: {
                                HStack(alignment: .center, spacing: 12) {
                                    Image(systemName: tab.rawValue)
                                        .font(.system(size: 20))
                                    if !isCollapsed {
                                        Text(tab.title)
                                            .font(.caption2)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical, 12)
                                .ifCondition(selectedTab == tab) { view in
                                    view.background(.appPrimary.opacity(0.2))
                                }
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .foregroundStyle(selectedTab == tab ? .appPrimary : .gray)
                            }
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: isCollapsed ? 80 : 300)
            .frame(maxHeight: .infinity)
            Rectangle()
                .frame(width: 1)
                .foregroundColor(.gray.opacity(0.3))
        }
    }
}

#Preview {
    @Previewable @State var selectedTab: Tab = .home
    
    HStack {
        CustomSideBar(selectedTab: $selectedTab)
        Spacer()
        
    }
}
