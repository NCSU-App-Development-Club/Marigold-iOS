//
//  WelcomeView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//  Modified by Carolina Bolnykh
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack() {
                    Text("Marigold @")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.top, 100)
                }
                HStack() {
                    Text("NC State University")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.red)
                }
                
                HStack() {
                    Text("Welcome Back!")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top, 75)
                }
                
                HStack() {
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            Text("Don't have an account? ")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.black)
                            +
                            Text("Sign up")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.blue)
                                .underline()
                        }
                    )
                    
                }
                NavigationLink(destination: SignInView()) {
                    TextButtonView(text: "Sign In")
                }
                .padding(.top, 200)
                
                Spacer()
            }
            .background(
                Image("ncsu-talley")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.5)
            )
        }
    }
}

#Preview {
    WelcomeView()
}
