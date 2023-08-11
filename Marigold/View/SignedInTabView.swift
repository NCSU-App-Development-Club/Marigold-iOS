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
            Text("Upcoming")
                .tabItem {
                    Label("Upcoming", systemImage: "house")
                }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            Text("Clubs")
                .tabItem {
                    Label("Clubs", systemImage: "person.3")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    SignedInTabView()
}
