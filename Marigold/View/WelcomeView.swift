//
//  WelcomeView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to project Marigold!")
                
                NavigationLink(
                    destination: {
                        SignUpView()
                    },
                    label: {
                        Text("Create Account")
                    }
                )
                .buttonStyle(.borderedProminent)
                
                NavigationLink(
                    destination: {
                        SignInView()
                    },
                    label: {
                        Text("Sign In")
                    }
                )
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
