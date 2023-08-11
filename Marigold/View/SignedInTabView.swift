//
//  SignedInTabView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//

import SwiftUI

struct SignedInTabView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            Text("Clubs")
                .tabItem {
                    Label("Clubs", systemImage: "person.3")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                }
                .padding()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                            
                        },
                        label: {
                            Image(systemName: "gear")
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    SignedInTabView()
}
