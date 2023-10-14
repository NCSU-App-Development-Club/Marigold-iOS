//
//  SignInView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//

import RealmSwift
import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject private var app: RealmSwift.App
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var signingIn: Bool = false
    @State private var failedToSignIn: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                
                ToggleableTextField(placeholder:"Password",text:$password).textContentType(nil)
                
                Button(
                    action: {
                        signIn()
                    },
                    label: {
                        Group {
                            if signingIn {
                                ProgressView()
                            } else {
                                Text("Sign In")
                                    .fontWeight(.bold)
                            }
                        }
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                    }
                )
                .disabled(email.isEmpty || password.isEmpty)
                .buttonStyle(.borderedProminent)
                .alert("Failed to sign in.", isPresented: $failedToSignIn, actions: {})
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .navigationTitle(Text("Sign In", comment: "Title at the top of the sign in view."))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func signIn() {
        if signingIn {
            return
        }
        
        signingIn = true
        
        Task {
            do {
                let user = try await app.login(credentials: .emailPassword(email: email, password: password))
                signingIn = false
            } catch {
                signingIn = false
                failedToSignIn = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
}
