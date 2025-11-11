//
//  HomeScreen.swift
//  SpendLess
//
//  Created by Alimmz on 11/9/25.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(Router.self) private var router
    @State private var progress = 0.6
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.appPrimary)
                    .frame(maxWidth: 48, maxHeight: 48)
                    .overlay {
                        Image(systemName: "person")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                Text("Hello, Alex")
                    .font(.title2)
                Spacer()
                Image(systemName: "bell")
                    .font(.title2)
                
            }
            Spacer()
                .frame(height: 24)
            ScrollView {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("This Month's Spending")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("$1,250.00")
                            .font(.largeTitle.bold())
                            .foregroundColor(.primary)
                        
                        Text("-2.1% from last month")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemGroupedBackground))
                .clipShape(.rect(cornerRadius: 16))
                
                Spacer()
                    .frame(height: 16)
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Monthly Budget")
                                .font(.body)
                            Spacer()
                            Text("$1,250 / $2,000")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 20 / 2)
                                    .fill(Color.gray.opacity(0.2))
                                
                                RoundedRectangle(cornerRadius: 20 / 2)
                                    .fill(.appPrimary)
                                    .frame(width: geo.size.width * progress)
                            }
                        }
                        .frame(height: 12)
                        .animation(.easeInOut, value: progress)
                        
                        Text("$750 Remaining")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemGroupedBackground))
                .clipShape(.rect(cornerRadius: 16))
                Spacer()
                    .frame(height: 32)
                VStack {
                    HStack {
                        Text("Recent Transactions")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    ForEach(1...5, id: \.self) { num in
                        HStack {
                            Circle()
                                .fill(.appPrimary)
                                .frame(maxWidth: 48, maxHeight: 48)
                                .overlay {
                                    Image(systemName: "basket.fill")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                }
                            Spacer()
                                .frame(maxWidth: 16)
                            VStack(alignment: .leading) {
                                Text("Amazon")
                                    .font(.headline)
                                Text("Shopping")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("+$45.00")
                                    .font(.headline)
                                Text("Today")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color(.systemGroupedBackground))
                        .clipShape(.rect(cornerRadius: 12))
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
            .environment(Router())
    }
}
