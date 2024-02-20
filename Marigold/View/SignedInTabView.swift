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
            
            ExploreView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            HomeView()
                .tabItem {
                    Label("Clubs", systemImage: "person.3")
                }
            
            Text("")
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    SignedInTabView()
}
